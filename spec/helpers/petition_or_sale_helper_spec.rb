require 'rails_helper'

RSpec.describe PetitionOrSaleHelper, type: :helper do
  let(:category) { FactoryBot.create(:category) }
  let!(:subcategory) { FactoryBot.create(:subcategory, category: category) }

  describe '#petition_or_sale_title' do
    subject { helper.petition_or_sale_title }

    it 'return the petititon title' do
      allow(helper).to receive(:current_page?).and_return(true)
      expect(subject).to eq('¿Qué estás buscando?')
    end

    it 'return the sale title' do
      allow(helper).to receive(:current_page?).and_return(false)
      expect(subject).to eq('¿Qué estás vendiendo?')
    end
  end

  describe '#petition_or_sale_path' do
    subject { helper.petition_or_sale_path(category_id: category.id) }

    it 'return the petititon path' do
      allow(helper).to receive(:current_page?).and_return(true)
      expect(subject).to eq(subcategories_petitions_path(id: category.id))
    end

    it 'return the sale path' do
      allow(helper).to receive(:current_page?).and_return(false)
      expect(subject).to eq(subcategories_sales_path(id: category.id))
    end
  end

  describe '#petition_or_sale_form' do
    subject { helper.petition_or_sale_form(category: category.id, subcategory: subcategory.id) }

    it 'return the petititon form link' do
      allow(helper).to receive(:current_page?).and_return(true)
      expect(subject).to eq(new_petition_path(category: category.id, subcategory: subcategory.id))
    end

    it 'return the sale form link' do
      allow(helper).to receive(:current_page?).and_return(false)
      expect(subject).to eq(new_sale_path(category: category.id, subcategory: subcategory.id))
    end
  end
end
