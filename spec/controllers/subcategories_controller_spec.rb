require 'rails_helper'

RSpec.describe SubcategoriesController, type: :controller do
  let!(:category) { FactoryBot.create(:category) }
  let!(:subcategory) { FactoryBot.create(:subcategory) }
  let(:user) { FactoryBot.create(:user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'Get #index' do
    it 'Obtain template to subcategory view' do
      get :index, params: { id: category.id }
      expect(subject).to render_template(:index)
    end

    it 'redirects to homepage' do
      get :index, params: { id: 0 }
      expect(response.status).not_to eq(200)
    end
  end
end
