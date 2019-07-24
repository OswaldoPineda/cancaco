require 'rails_helper'

RSpec.describe PetitionsController, type: :controller do
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

  before do
    user.confirm
    sign_in user
  end

  describe 'GET #new' do
    it 'valid params' do
      get :new, params: { category: category.id, subcategory: subcategory.id }
      should render_template('petitions/new')
    end

    context 'When receive invalid category' do
      it 'redirect to /buy' do
        get :new, params: { category: 100_000_000, subcategory: subcategory.id }
        should redirect_to(buy_index_path)
      end
    end

    context 'When receive invalid subcategory' do
      it 'redirect to /buy' do
        get :new, params: { category: category.id, subcategory: -12 }
        should redirect_to(buy_index_path)
      end
    end
  end

  describe 'POST #create' do
    before do
      post :create, params: { petition: petition }
    end
    it { should redirect_to(buy_index_path) }
    it { should set_flash }
  end

  describe 'POST #create invalid' do
    before do
      post :create, params: { petition: { category_id: category.id,
                                          subcategory_id: subcategory.id,
                                          deadline: '' } }
    end
    it { should render_template('petitions/new') }
  end
end
