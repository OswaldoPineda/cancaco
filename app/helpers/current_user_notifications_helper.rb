module CurrentUserNotificationsHelper
  def current_user_notifications(current_user)
    current_user&.company&.notifications || []
  end

  def last_notifications(notifications, number = 3)
    notifications.last(number).reverse || []
  end
end
