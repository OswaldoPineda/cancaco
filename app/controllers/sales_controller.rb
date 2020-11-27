class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :valid_categories_and_subcategories, only: :new
  respond_to :html

  def new
    @error_messages = []
    @sale = Sale.new(category_id: @category.id)
    @sale.subcategory_id = @subcategory&.id
    # @images = @sale.images.new
  end

  def create
    @sale = Sale.new(valid_params)
    @sale.company_id = current_user.company_id
    build_images
    if @sale.save
      redirect_to categories_sales_path, notice: I18n.t('success.messages.sale_published')
    else
      @category = Category.find(@sale.category_id)
      @subcategory = @category.subcategories.find(@sale.subcategory_id)
      @images = @sale.images.new
      respond_with @sale
    end
  end

  private

  def build_images
    (params.dig(:sale, :image, :file) || []).each do |img|
      @sale.images.build(file: img)
    end
  end

  def valid_categories_and_subcategories
    @category = Category.find_by(id: params[:category])
    if @category.nil?
      redirect_to categories_sales_path, alert: I18n.t('errors.messages.category_not_found')
    else
      valid_subcategory
    end
  end

  def valid_subcategory
    @subcategory = @category.subcategories.find_by(id: params[:subcategory])
    if @subcategory.nil? && category_has_subcategory?
      redirect_to categories_sales_path, alert: I18n.t('errors.messages.subcategory_not_found')
    end
  end

  def category_has_subcategory?
    @category.subcategories.present?
  end

  def valid_params
    params.require(:sale).permit(:title,
                                 :description,
                                 :extra_info,
                                 :quantity,
                                 :price,
                                 :category_id,
                                 :subcategory_id,
                                 :document,
                                 images_attributes: [:file])
  end
end
