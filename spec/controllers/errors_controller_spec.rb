require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  describe 'Get #not-found' do
    it 'Obtain template to 404 error' do
      get :not_found
      expect(response).to render_template(:error_404)
    end
  end

  describe 'Get #permission_denied' do
    it 'Obtain template to 422 error' do
      get :permission_denied
      expect(response).to render_template(:error_422)
    end
  end

  describe 'Get #internal_server_error' do
    it 'Obtain template to 500 error' do
      get :internal_server_error
      expect(response).to render_template(:error_500)
    end
  end
end
