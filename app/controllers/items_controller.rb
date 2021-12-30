class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :category_id, :state_id, :charge_id, :area_id, :term_id, :price).merge(user_id: current_user.id)
  end
end
