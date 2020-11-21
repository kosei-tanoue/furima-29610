class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_sign_in, only: [:index]

  def index
    # @item = Item.find(params[:id])
    # binding.pry
    @order_address = OrderAddress.new
  end
  
  def create
    # binding.pry
    # @item = Item.find(params[:id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render "index"
    end
  end


  private
  
  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :order_id, :building_name, :phone_number, :item_id, :user_id)
  end
  
  def item_find
    @item = Item.find(params[:id])
  end
  
  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end

  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end


