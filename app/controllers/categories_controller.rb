class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    category.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @category.save
          redirect_to categories_path, notice: 'Category was successfully created.'
        else
          redirect_to new_category_path, notice: 'Category was not successfully created.'
        end
      end
    end
  end

  private

  def category_params
    params.require(:new_category).permit(:name, :icon)
  end
end
