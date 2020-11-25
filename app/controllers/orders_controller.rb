class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create, :pay_item, :move_to_index, :not_access_sold_out]
  before_action :move_to_sign_in, only: [:index]
  before_action :move_to_index, only: [:index]
  before_action :not_access_sold_out, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end


  def pay_item

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end


  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def not_access_sold_out
    if @item.order.present?
      redirect_to root_path
    end
  end
end
