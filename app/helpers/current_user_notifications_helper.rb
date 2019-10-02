module CurrentUserNotificationsHelper
  def current_user_notifications(current_user)
    current_user&.company&.notifications || []
  end

  def last_notifications(notifications, number = 3)
    notifications.last(number).reverse || []
  end

  def last_hundred_notifications(notifications, number = 100)
    notifications.last(number).reverse || []
  end

  def get_time_difference(notification_time)
    if (Time.now.strftime("%Y").to_i - notification_time.strftime("%Y").to_i) > 0 ||
       (Time.now.strftime("%m").to_i - notification_time.strftime("%m").to_i) > 0 ||
       (Time.now.strftime("%d").to_i - notification_time.strftime("%d").to_i) > 0
      notification_time.strftime("%d/%m/%Y %H:%M")
    else
      currenthr_less_notificationhr = Time.now.utc.strftime("%H").to_i - notification_time.strftime("%H").to_i
      case currenthr_less_notificationhr
      when 0
        if (Time.now.strftime("%M").to_i - notification_time.strftime("%M").to_i) == 0
          "Hace un momento"
        else
          (Time.now.strftime("%M").to_i - notification_time.strftime("%M").to_i).to_s + " min"
        end
      when 1
        minutes_to_complete_hour = 60 - notification_time.strftime("%M").to_i
        total_minutes = minutes_to_complete_hour + Time.now.strftime("%M").to_i
        if total_minutes >= 60
          "1 hora"
        else
          (minutes_to_complete_hour + Time.now.strftime("%M").to_i).to_s + " min"
        end
      else
        (Time.now.utc.strftime("%H").to_i - notification_time.strftime("%H").to_i).to_s + " horas"
      end
    end
  end
end
