require 'rails_helper'

RSpec.describe NotificationRelayJob, type: :job do
  let(:company) { create(:company) }
  let(:category) { create(:category) }
  let(:measure) { create(:measure) }
  let(:petition) { create(:petition, company: company, category: category, measure_id: measure.id) }
  let(:recipient) { create(:company) }
  let(:notification) { create(:notification, company: company, recipient: recipient, notifiable: petition) }

  describe '#perform_later' do
    it 'matches with enqueued as' do
      expect {
        notification
      }.to have_enqueued_job.on_queue('deliver')
    end
  end

  describe '#perform_now' do
    it 'relay service is called' do
      expect_any_instance_of(NotificationRelayService).to receive(:call)
      NotificationRelayJob.perform_now(notification.id)
    end
  end
end
