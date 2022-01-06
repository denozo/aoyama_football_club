class Admins::CategoriesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all

    if @category.save
      redirect_to admins_categories_path, notice: "カテゴリーを追加しました。"
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
      redirect_to admins_categories_path, notice: "カテゴリーを変更しました。"
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admins_categories_path, notice: "カテゴリーを削除しました。"
  end


  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end