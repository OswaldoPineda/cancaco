require 'rails_helper'

RSpec.describe NotificationPetitionJob, type: :job do
  let(:category) { create(:category) }
  let(:company) { create(:company, category: category) }
  let(:measure) { create(:measure) }
  let(:petition) { create(:petition, company: company, category: category, measure_id: measure.id) }
  describe '#perform_later' do
    it 'matches with enqueued as' do
      expect { petition }.to have_enqueued_job.on_queue('notifications')
    end
  end

  describe '#perform_now' do
    it 'petition service is called' do
      expect_any_instance_of(NotificationPetitionService).to receive(:call)
      NotificationPetitionJob.perform_now(petition.id)
    end
  end
end
