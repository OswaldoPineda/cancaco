require 'rails_helper'

RSpec.describe ConversationChannel, type: :channel do
  let(:user) { create(:user) }
  let(:category) { create(:category, title: 'tecnologia') }
  let!(:subcategory) { create(:subcategory, category: category) }
  let(:company_sender) { create(:company, category: category) }
  let(:company_recipient) { create(:company, category: category) }
  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_recipient)
  }

  it 'successfully subscribes' do
    subscribe(conversation: conversation.id)
    expect(subscription).to be_confirmed
  end

  it 'successfully unsubscribe' do
    subscribe(conversation: conversation.id)
    expect(subscription).to be_confirmed
    subscription.unsubscribe_from_channel
  end
end
