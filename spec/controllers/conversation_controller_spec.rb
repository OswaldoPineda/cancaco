require 'rails_helper'

RSpec.describe ConversationController, type: :controller do
  let(:user) { create(:user) }

  before do
    user.confirm
    sign_in user
  end

  describe 'Get index' do
    before { get :index }
    it { should render_template('index') }
  end
end
