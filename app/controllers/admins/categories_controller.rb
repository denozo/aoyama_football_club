class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    category = Category.new(category_params)
    
    if category.save
      redirect_to admins_categories_path, notice: "カテゴリーを登録しました"
    else
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    
    if category.update(category_params)
      redirect_to admins_categories_path, notice: "変更を保存しました"
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end