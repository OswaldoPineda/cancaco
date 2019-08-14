require 'rails_helper'

RSpec.describe SearchHelper, type: :helper do
  let(:measure) { FactoryBot.create(:measure) }
  let(:category) { FactoryBot.create(:category) }
  let!(:subcategory) { FactoryBot.create(:subcategory, category_id: category.id) }
  let(:company) { FactoryBot.create(:company) }
  let(:user) { FactoryBot.create(:user, company_id: company.id) }
  let(:petition) {
    FactoryBot.attributes_for(:petition,
                              category_id: category.id,
                              measure_id: measure.id,
                              subcategory_id: subcategory.id,
                              company_id: company.id )
  }

  describe '#search_titile' do
    it 'return the title capitalized' do
      title = search_title(title: 'Tecnologia', params: 'Alimentos')
      expect(title).to eq('Tecnologia')
    end

    it 'return the params capitalized' do
      title = search_title(title: nil, params: 'Alimentos')
      expect(title).to eq('Alimentos')
    end
  end
end
