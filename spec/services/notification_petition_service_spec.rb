require 'rails_helper'

RSpec.describe NotificationPetitionService, type: :service do
  let(:category) { create(:category) }
  let(:petitioner_company) { create(:company, category: category) }
  let!(:recipient_company) { create(:company, category: category) }
  let(:measure) { create(:measure) }
  let(:petition) { create(:petition, company: petitioner_company, category: category, measure: measure) }

  describe '#call' do
    subject { described_class.new(petition).call }
    it 'notifications for recipient companies are created' do
      expect{ subject }.to change{ Notification.count }.from(0).to(1)
    end
  end
end
