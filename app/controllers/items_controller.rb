class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    @item.save
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explain_item, :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
