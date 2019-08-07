class PetitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_categories_and_subcategories, only: :new
  respond_to :js, :html

  def new
    @error_messages = []
    @petition = Petition.new(category_id: @category.id)
    @petition.subcategory_id = @subcategory&.id
    @measures = Measure.all
  end

  def create
    @measures = Measure.all
    @petition = fill_request
    if @petition.save
      redirect_to categories_path, notice: I18n.t('success.messages.petition_published')
    else
      @category = Category.find(@petition.category_id)
      @subcategory = @category.subcategories.find(@petition.subcategory_id) if params[:subcategory]
      respond_with @petition
    end
  end

  protected

  def fill_request
    @petition = Petition.new(valid_params)
    @petition.deadline = week_num_to_deadline(valid_params[:deadline])
    @petition.company_id = current_user.company_id
    @petition
  end

  def week_num_to_deadline(num)
    num.to_i.weeks.since.to_date
  end

  def valid_categories_and_subcategories
    @category = Category.find_by(id: params[:category])
    if @category.nil?
      redirect_to categories_path, alert: I18n.t('errors.messages.category_not_found')
    else
      valid_subcategory
    end
  end

  def valid_subcategory
    @subcategory = @category.subcategories.find_by(id: params[:subcategory])
    if @subcategory.nil? && category_has_subcategory?
      redirect_to categories_path, alert: I18n.t('errors.messages.subcategory_not_found')
    end
  end

  def category_has_subcategory?
    @category.subcategories.present?
  end

  private

  def valid_params
    params.require(:petition).permit(:title,
                                     :description,
                                     :quantity,
                                     :measure_id,
                                     :deadline,
                                     :category_id,
                                     :subcategory_id)
  end
end
