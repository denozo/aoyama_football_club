class ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(10)
    
    @items = @items.where.not(is_active: false)
    
  end


  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end
  
end
