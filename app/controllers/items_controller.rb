class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :explain_item, :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id).merge(user_id: current_user.id)
  end
end
