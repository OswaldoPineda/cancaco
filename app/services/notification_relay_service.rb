class NotificationRelayService
  def initialize(notification)
    @notification = notification
    @recipient = notification.recipient
    @notification_counter = recipient.notifications.length
  end

  def call
    html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore}",
                                        locals: { notification: notification, },
                                        formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}",
                                 html: html,
                                 counter: notification_counter
  end

  private

  attr_reader :notification, :recipient, :notification_counter
end
