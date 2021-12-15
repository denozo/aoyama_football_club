class Admins::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)

    if item.save
      redirect_to admins_item_path(item), notice: "アイテムを追加しました"
    else
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    
    if item.update(item_params)
      redirect_to admins_item_path(item), notice: "アイテム情報を更新しました"
    else
      render :edit
    end
    
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end

end