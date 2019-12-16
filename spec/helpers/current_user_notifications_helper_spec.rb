require 'rails_helper'

RSpec.describe CurrentUserNotificationsHelper, type: :helper do
  let(:category) { create(:category) }
  let(:measure) { create(:measure) }
  let(:sender_company) { create(:company) }
  let(:recipient_company) { create(:company) }
  let(:current_user) { create(:user, company: recipient_company) }
  let(:notifiable) { create(:petition, company: sender_company, category: category, measure: measure) }
  let!(:notifications) {
    create_list(
      :notification, 5, company: sender_company, recipient: recipient_company, notifiable: notifiable
    )
  }
  describe '#get_current_user_notifications' do
    it 'return the notifications of the current user' do
      current_user_notifications = current_user_notifications(current_user)
      expect(current_user_notifications).to match_array(notifications)
    end
  end

  describe '#get_last_notifications' do
    it 'return the last notifications ordered' do
      last_three_notifications = last_notifications(notifications)
      expect(last_three_notifications).to match_array(notifications.last(3))
    end
  end

  describe '#get_last_100_notifications' do
    it 'return the last 100 notifications ordered' do
      last_hundred_notifications = last_hundred_notifications(notifications)
      expect(last_hundred_notifications).to match_array(notifications.last(100))
    end
  end

  describe '#get_time_difference' do
    it 'return the time difference between current time and the created_at' do
      time_difference = get_time_difference(Time.now.utc)
      expect(time_difference).to include("Hace un momento")
    end
  end
end
