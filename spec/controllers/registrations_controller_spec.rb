require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let!(:category) { create(:category, title: "Hogar") }
  let(:company) { create(:company, category_id: category.id) }
  let(:user) { create(:user, company_id: company.id ) }
  let(:user_attributes) { attributes_for(:user) }

  before :each do |test|
    request.env['devise.mapping'] = Devise.mappings[:user]
    user.confirm if test.metadata[:user_logged]
    sign_in user if test.metadata[:user_logged]
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

  describe 'Put #update', :user_logged do
    context 'with valid params' do
      it 'should redirect to homepage' do
        put :update, params: {
          user: { user: user, current_password: user.password }
        }
        expect(response).to have_http_status(:redirect)
      end
      it 'should update full name' do
        old_full_name = user.full_name
        put :update, params: {
          user: {
            user: user,
            full_name: 'new full user name',
            current_password: user.password
          }
        }
        expect(user.reload.full_name).not_to eq(old_full_name)
      end
    end

    context 'with invalid params' do
      it 'should not redirect to homepage' do
        put :update, params: { user: user }
        expect(response).to have_http_status(:ok)
      end
      it 'should keep the same full name' do
        old_full_name = user.full_name
        put :update, params: {
          user: user,
          full_name: 'new full user name'
        }
        expect(user.reload.full_name).to eq(old_full_name)
      end
    end
  end
end
