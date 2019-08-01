class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for "chat:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
