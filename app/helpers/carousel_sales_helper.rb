module CarouselSalesHelper
  def subcategory(sale)
    Subcategory.where(id: sale.subcategory_id).first
  end

  def latest_sales(category, limit = 8)
    Sale.where(category_id: category.id).last(limit).select { |s| s.images.first.nil? == false }
  end

  def show_latest_sales_by_category(category_id)
    unless Category.all.empty?
      category = Category.where(id: category_id).first
      unless category.nil?
        sales = latest_sales(category, 8)
        unless sales.empty?
          render partial: "sales/sliders/carousel_track", locals: { category: category, sales: sales }
        end
      end
    end
  end
end
