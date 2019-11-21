require 'rails_helper'

RSpec.describe CarouselSalesHelper, type: :helper do

  before do
    @category = FactoryBot.create(:category)
    @category_b = FactoryBot.create(:category)
    @company = FactoryBot.create(:company, category: @category)
    @subcategory = FactoryBot.create(:subcategory, category: @category)
    @sales = FactoryBot.create_list(:sale_image, 10, company: @company, category: @category, subcategory_id: @subcategory.id)
    @sales_b = FactoryBot.create_list(:sale, 10, company: @company, category: @category_b, subcategory_id: @subcategory.id)
  end

  describe '#subcategory' do
    it 'gets the sale subcategory' do
      expect(subcategory(@sales.first)).to eql(@subcategory)
    end
  end

  describe '#latest_sales' do
    it 'has sales with images' do
      expect(latest_sales(@category)).not_to be_empty
    end
    it 'does not have sales with images' do
      expect(latest_sales(@category_b)).to be_empty
    end
  end

  describe '#show_latest_sales_by_category' do
    it 'should show the carousel' do
      show_latest_sales_by_category(@category.id)
      expect(rendered).to match /<div class="carousel-section">/
    end
    it 'should not show the carousel' do
      show_latest_sales_by_category(@category_b.id)
      expect(rendered).to match ''
    end
  end
end
