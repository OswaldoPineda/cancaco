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
    it "Obtain template to subcategory view" do
      get :index, params: { id: category.id }
      should render_template(:subcategory)
    end
  end
end
