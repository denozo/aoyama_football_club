class Admins::CategoriesController < ApplicationController
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    category = Category.new(category_params)
    category.save
    redirect_to admins_categories_path
  end

  def edit
  end

  def update
  end
  
  private
  
  def category_params
    params.require(:category).permit(:category_name)
  end
  
end