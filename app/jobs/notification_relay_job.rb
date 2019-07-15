class NotificationRelayJob < ApplicationJob
  queue_as :deliver

  def perform(notification_id)
    notification = Notification.find(notification_id)
    NotificationRelayService.new(notification).call
  end
end
