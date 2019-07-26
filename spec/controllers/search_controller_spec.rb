require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:company) { create(:company, category: category) }
  let(:measure) { create(:measure) }
  let!(:petition) { create(:petition, company: company, category: category, measure_id: measure.id) }

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
end
