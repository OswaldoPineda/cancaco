class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_categories

  def search_by_title
    text_to_search = params[:search].downcase
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if text_to_search.blank?

    petition_results = Petition.where('LOWER(title) LIKE ? AND active = ?', "%#{text_to_search}%", 'true')
    sale_results = Sale.where('LOWER(title) LIKE ? AND active = ?', "%#{text_to_search}%", 'true')
    @results = (petition_results + sale_results).sort_by(&:created_at)
    @results_page = Kaminari.paginate_array(@results).page(params[:page] || 1).per(9)
    render :index
  end

  def search_by_category
    category = Category.where(title: params[:title]).first
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if category.blank?

    @title = category.title
    petition_results = Petition.where('category_id = ? AND active = ?', category.id, 'true')
    sale_results = Sale.where('category_id = ? AND active = ?', category.id, 'true')
    @results = (petition_results + sale_results).sort_by(&:created_at)
    @results_page = Kaminari.paginate_array(@results).page(params[:page] || 1).per(9)
    render :index
  end

  def search_by_subcategory
    subcategory = Subcategory.where(title: params[:title]).first
    return redirect_to(root_path, alert: I18n.t('errors.messages.blank')) if subcategory.blank?

    @title = subcategory.title
    petition_results = Petition.where('subcategory_id = ? AND active = ?', subcategory.id, 'true')
    sale_results = Sale.where('subcategory_id = ? AND active = ?', subcategory.id, 'true')
    @results = (petition_results + sale_results).sort_by(&:created_at)
    @results_page = Kaminari.paginate_array(@results).page(params[:page] || 1).per(9)
    render :index
  end

  private

  def load_categories
    @categories = Category.all
  end
end
