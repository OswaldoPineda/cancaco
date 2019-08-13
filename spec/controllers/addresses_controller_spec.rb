require 'rails_helper'

RSpec.describe AddressesController, type: :controller do
  let(:category) { create(:category) }
  let(:company) { create(:company, category: category) }
  let(:user) { create(:user, company: company) }
  let(:address) { create(:address, company: company) }
  let(:address_attr) { attributes_for(:address) }

  before do
    user.confirm
    sign_in user
  end

  describe 'Get #index' do
    before { get :index }
    it { should render_template(:index) }
  end

  describe 'Post #create' do
    before do
      post :create, params: { address: address_attr }
    end

    it { should redirect_to(addresses_path) }
    it { should set_flash }
  end

  describe 'Put #update' do
    before do
      put :update, params: { id: address.id, address: address_attr }
    end

    it { should redirect_to(addresses_path) }
    it { should set_flash }
  end

  describe 'Put #update' do
    before do
      delete :destroy, params: { id: address.id, address: address_attr }
    end

    it { should redirect_to(addresses_path) }
    it { should set_flash }
  end
end
