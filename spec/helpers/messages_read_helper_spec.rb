require 'rails_helper'

RSpec.describe MessagesReadHelper, type: :helper do
  let(:category) { create(:category, title: 'tecnologia') }
  let(:company_sender) { create(:company, category: category) }
  let(:company_recipient) { create(:company, category: category) }
  let(:user_recipient) { create(:user, company: company_recipient) }
  let(:user_sender) { create(:user, company: company_sender) }
  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_recipient)
  }
  let!(:message) {
    create(:message,
           conversation: conversation,
           user: user_sender,
           recipient: company_recipient)
  }

  describe '#mark_as_read' do
    it 'Mark as read the messages' do
      expect(mark_as_read(conversation.messages, user_recipient.company.id)).to eq([message])
    end
  end
end
