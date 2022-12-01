class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.author_id = current_user.id

    if category.save
      redirect_to categories_path, notice: 'Category was created successfully'
    else
      redirect_to new_category_path, notice: 'Category was not created successfully'
    end
  end

  private

  def category_params
    params.require(:new_category).permit(:name, :icon)
  end
end
