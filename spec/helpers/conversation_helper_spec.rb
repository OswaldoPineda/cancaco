require 'rails_helper'

RSpec.describe ConversationUsersHelper, type: :helper do
  let(:category) { create(:category, title: 'tecnologia') }
  let!(:subcategory) { create(:subcategory, category: category) }
  let(:company_sender) { create(:company, category: category) }
  let(:company_receiver) { create(:company, category: category) }
  let(:user_sender) { create(:user, company: company_sender) }
  let(:user_recipient) { create(:user, company: company_receiver) }
  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_receiver)
  }

  describe '#company_recipient' do
    it 'should return a company' do
      expect(company_recipient(user_sender, conversation)).to eq(company_receiver)
      expect(company_recipient(user_recipient, conversation)).to eq(company_sender)
    end
  end

  describe '#recipient_or_sender_partial' do
    it 'when sender is current user' do
      expect(recipient_or_sender_partial(user_sender, conversation)).to eq('conversations/subject_info')
    end

    it 'when recipient is current user' do
      expect(recipient_or_sender_partial(user_recipient, conversation)).to eq('conversations/sender_info')
    end
  end
end
