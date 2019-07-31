class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :load_categories

  def search_by_title
    text_to_search = params[:search].downcase
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if text_to_search.blank?

    @results = Petition.where('title LIKE ?', "%#{text_to_search}%").where(active: true)
    render :index
  end

  private

  def load_categories
    @categories = Category.all
  end
end
