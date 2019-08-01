class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :load_categories

  def search_by_title
    text_to_search = params[:search].downcase
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if text_to_search.blank?

    @results = Petition.where('title LIKE ?', "%#{text_to_search}%").where(active: true)
    render :index
  end

  def search_by_category
    category = Category.where(title: params[:title]).first
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if category.blank?

    @title = category.title
    @results = Petition.where(category_id: category.id).where(active: true)
    render :index
  end

  def search_by_subcategory
    subcategory = Subcategory.where(title: params[:title]).first
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if subcategory.blank?

    @title = subcategory.title
    @results = Petition.where(subcategory_id: subcategory.id).where(active: true)
    render :index
  end

  private

  def load_categories
    @categories = Category.all
  end
end
