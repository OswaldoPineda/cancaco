require 'rails_helper'

RSpec.describe SearchCatalogsController, type: :controller do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in user
    get :index
  end

  describe 'Get index' do
    it { should render_template('index') }
  end

  describe 'responds successfully' do
    it { expect(response.status).to eq(200) }
  end
end
