require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_attributes) { attributes_for(:user) }
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Get #new' do
    it "Obtain template to a new registration" do
      get :new
      should render_template(:new)
    end
  end

  describe 'Post #create' do
    it "Should redirect to confirm view" do
      post :create, params: { user: user_attributes }
      expect(response).to have_http_status(:found)
    end
  end
end
