class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    # binding.pry
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain_item, :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
