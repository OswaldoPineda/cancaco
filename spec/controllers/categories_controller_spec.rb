require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category) { FactoryBot.create(:category) }
  let(:user) { FactoryBot.create(:user) }
  before do
    user.confirm
    sign_in user
  end

  describe 'Get index' do
    before { get :index }
    it { should render_template('index') }
  end

  describe 'Get database data' do
    subject { assigns(@categories) }
    it { is_expected.not_to be_nil }
  end
end
