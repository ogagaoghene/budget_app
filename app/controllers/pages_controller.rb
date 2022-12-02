class PagesController < ApplicationController
  def home
    return unless current_user

    redirect_to categories_path
  end
end
