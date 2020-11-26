class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to items_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain_item, :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_root
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

end
