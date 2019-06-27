class SubcategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @subcategories = Category.find_by(id: params[:id]).subcategories.all
    @title = Category.find_by(id: params[:id]).title
    render template: "buy/subcategory"
  end
end
