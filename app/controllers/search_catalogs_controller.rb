class SearchCatalogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    render file: 'searches/search_catalogs/index'
  end
end
