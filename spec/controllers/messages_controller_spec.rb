require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:category) { create(:category, title: 'tecnologia') }
  let!(:subcategory) { create(:subcategory, category: category) }
  let(:company_sender) { create(:company, category: category) }
  let(:company_recipient) { create(:company, category: category) }
  let(:user_sender) { create(:user, company: company_sender) }
  let(:user_recipient) { create(:user, company: company_recipient) }
  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_recipient)
  }
  let!(:message) {
    attributes_for(:message,
                   conversation_id: conversation.id,
                   recipient: company_recipient)
  }

  before do
    user_sender.confirm
    user_recipient.confirm
    sign_in user_sender
  end

  describe 'POST #create message user sender' do
    it 'increase messages by one' do
      expect { post :create, params: { message: message } }.to change(Message, :count).by(1)
    end
  end

  describe 'POST #create message user recipient' do
    before do
      sign_in user_recipient
      post :create, params: { message: message }
    end
    it { render_template('show') }
  end
end
