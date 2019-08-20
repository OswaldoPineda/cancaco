module CategoriesIconsHelper
  def load_image(category_title)
    if FileTest.exist?("app/assets/icons/categories/#{category_title.parameterize.underscore}.png")
      image_tag("categories/#{category_title.parameterize.underscore}.png", class: "image")
    else
      I18n.t('errors.messages.not_found_image')
    end
  end
end
