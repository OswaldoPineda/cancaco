require 'rails_helper'

RSpec.describe NotificationRelayService, type: :job do
  let(:user) { create(:user) }
  let(:petitioner_company) { create(:company, user: user) }
  let(:category) { create(:category) }
  let(:measure) { create(:measure) }
  let(:petition) { create(:petition, company: petitioner_company, category: category, measure_id: measure.id) }
  let(:recipient_company) { create(:company) }
  let(:notification) { create(:notification, company: petitioner_company, recipient: recipient_company, notifiable: petition) }

  describe '#call' do
    subject { described_class.new(notification).call }
    it 'partial of notification is sent to the recipient' do
      expect { subject }.to have_broadcasted_to("notifications:#{notification.recipient_id}").
                            with{ |data|
                              expect(data['counter']).to eq(recipient_company.notifications.length)
                              expect(data['html']).not_to be nil
                            }
    end
  end
end
