require 'rails_helper'

RSpec.describe SendMessagesJob, type: :job do
  let(:category) { create(:category, title: 'tecnologia') }
  let!(:subcategory) { create(:subcategory, category: category) }
  let(:company_sender) { create(:company, category: category) }
  let(:company_recipient) { create(:company, category: category) }
  let(:user_sender) { create(:user, company: company_sender) }
  let(:user_recipient) { create(:user, company: company_sender) }
  let(:conversation) {
    create(:conversation,
           sender: company_sender,
           recipient: company_recipient)
  }
  let(:message) {
    create(:message,
           conversation: conversation,
           user: user_sender,
           recipient: company_recipient)
  }

  describe '#perform_later' do
    it 'enqueued as' do
      expect { message }.to have_enqueued_job.on_queue('messages')
    end
  end

  describe '#perform_now' do
    it 'send message is called' do
      SendMessagesJob.perform_now(message.id)
      expect{ ActionCable.server.broadcast(
        "conversation:#{conversation}", message
      ) }.to have_broadcasted_to("conversation:#{conversation}")
    end
  end
end
