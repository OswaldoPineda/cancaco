module SearchHelper
  def search_title(title:, params:)
    title.nil? ? params.capitalize : title.capitalize
  end
end
