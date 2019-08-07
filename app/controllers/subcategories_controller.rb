class SubcategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find_by(id: params[:id])
    @subcategories = @category.subcategories
    @title = @category.title
  end
end
