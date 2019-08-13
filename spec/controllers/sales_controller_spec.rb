require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  let(:measure) { FactoryBot.create(:measure) }
  let(:category) { FactoryBot.create(:category) }
  let!(:subcategory) { FactoryBot.create(:subcategory, category_id: category.id) }
  let(:company) { FactoryBot.create(:company) }
  let(:user) { FactoryBot.create(:user, company_id: company.id) }
  let(:sale) {
    FactoryBot.attributes_for(:sale,
                              category_id: category.id,
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
      should render_template('sales/new')
    end

    context 'When receive invalid category' do
      it 'redirect to /sales/categories' do
        get :new, params: { category: 100_000_000, subcategory: subcategory.id }
        should redirect_to(categories_sales_path)
      end
    end

    context 'When receive invalid subcategory' do
      it 'redirect to /sales/categories' do
        get :new, params: { category: category.id, subcategory: -12 }
        should redirect_to(categories_sales_path)
      end
    end
  end

  describe 'POST #create' do
    before do
      post :create, params: { sale: sale }
    end
    it { should redirect_to(categories_sales_path) }
    it { should set_flash }
  end

  describe 'POST #create invalid' do
    before do
      post :create, params: { sale: { category_id: category.id,
                                      subcategory_id: subcategory.id,
                                      title: '' } }
    end
    it { should render_template('sales/new') }
  end
end
