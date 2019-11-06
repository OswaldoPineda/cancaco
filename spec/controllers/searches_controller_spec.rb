require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:subcategory) { create(:subcategory, category_id: category.id) }
  let(:company) { create(:company, category: category) }
  let(:measure) { create(:measure) }
  let!(:petition) {
    create(:petition,
           company: company,
           category: category,
           subcategory_id: subcategory.id,
           measure_id: measure.id)
  }

  before do
    user.confirm
    sign_in user
  end

  describe '#GET search by title' do
    it 'return to the homepage if the param is nil' do
      get :search_by_title, params: { search: nil }
      should redirect_to(root_path)
    end

    it 'redirect to the search view and have @resuts' do
      get :search_by_title, params: { search: 'wheels' }
      should render_template :index
      expect(assigns(:results)).to match_array(petition)
    end
  end

  context 'when user is logged out' do
    describe '#GET search by title' do
      it 'return to the homepage if the param is nil' do
        sign_out user
        get :search_by_title, params: { search: nil }
        should redirect_to(root_path)
      end

      it 'redirect to the search view and have @resuts' do
        sign_out user
        get :search_by_title, params: { search: 'wheels' }
        should render_template :index
        expect(assigns(:results)).to match_array(petition)
      end
    end
  end

  describe '#GET search by category' do
    it 'return to the homepage if the param is nil' do
      get :search_by_category, params: { title: nil }
      should redirect_to(root_path)
    end

    it 'redirect to the search view' do
      get :search_by_category, params: { title: category.title }
      should render_template :index
    end

    it 'have the @results and @title variables' do
      get :search_by_category, params: { title: category.title }
      expect(assigns(:results)).to match_array(petition)
      expect(assigns(:title)).to eq(category.title)
    end
  end

  describe '#GET search by subcategory' do
    it 'return to the homepage if the param is nil' do
      get :search_by_subcategory, params: { search: nil }
      should redirect_to(root_path)
    end

    it 'redirect to the search view' do
      get :search_by_subcategory, params: { title: subcategory.title }
      should render_template :index
      expect(assigns(:results)).to match_array(petition)
    end

    it 'have the @results and @title variables' do
      get :search_by_subcategory, params: { title: subcategory.title }
      expect(assigns(:results)).to match_array(petition)
      expect(assigns(:title)).to eq(subcategory.title)
    end
  end
end
