class Admins::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = '新規登録されました。'
      redirect_to admins_item_path(@item)
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
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      flash[:notice] = '変更を保存しました。'
      redirect_to admins_item_path(@item)
    else
      render :edit
    end
    
  end

  def destroy
    item = Item.find(params[:id])
    
    if item.destroy
      flash[:notice] = '削除されました。'
      redirect_to admins_items_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :is_active)
  end

end