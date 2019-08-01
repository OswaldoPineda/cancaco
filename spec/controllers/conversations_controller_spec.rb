require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let(:category) { create(:category, title: 'tecnologia') }
  let!(:subcategory) { create(:subcategory, category: category) }
  let(:company_sender) { create(:company, category: category) }
  let(:company_recipient) { create(:company, category: category) }
  let(:user_sender) { create(:user, company: company_sender) }
  let(:user_recipient) { create(:user, company: company_recipient) }
  let(:measure) { create(:measure) }

  let(:petition) {
    create(:petition,
           category: category,
           measure: measure,
           subcategory_id: subcategory,
           company: company_sender)
  }

  let!(:notification) {
    create(:notification,
           company: company_sender,
           recipient: company_recipient,
           notifiable: petition)
  }

  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_recipient)
  }

  before do
    user_sender.confirm
    sign_in user_sender
  end

  describe 'GET #index' do
    before { get :index }
    it { should render_template('index') }
  end

  describe 'GET #show' do
    let!(:message) {
      create(:message,
             conversation: conversation,
             user: user_sender,
             recipient: company_recipient)
    }
    before { get :show, params: { id: conversation.id } }
    it { should render_template('show') }
  end

  describe 'POST #create non-existing conversation' do
    before { post :create, params: { company: company_recipient, notification: notification } }
    it { should respond_with(302) }
  end

  describe 'POST #create existing conversation' do
    before { post :create, params: { company: company_recipient } }
    it { should respond_with(302) }
  end
end
