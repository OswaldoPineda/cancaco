module PetitionOrSaleHelper
  def petition_or_sale_title
    if current_page?(categories_petitions_path)
      I18n.t('helpers.title.petition')
    else
      I18n.t('helpers.title.sale')
    end
  end

  def petition_or_sale_path(category_id:)
    if current_page?(categories_petitions_path)
      subcategories_petitions_path(id: category_id)
    else
      subcategories_sales_path(id: category_id)
    end
  end

  def petition_or_sale_form(category:, subcategory:)
    if current_page?(subcategories_petitions_path)
      new_petition_path(category: category, subcategory: subcategory)
    else
      new_sale_path(category: category, subcategory: subcategory)
    end
  end
end
