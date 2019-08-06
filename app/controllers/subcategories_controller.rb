class SubcategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find_by_id(params[:id])
    if @category.present?
      @subcategories = @category.subcategories
      @title = @category.title
    else
      redirect_back(fallback_location: root_path, alert: I18n.t('errors.messages.category_not_found'))
    end
  end
end
