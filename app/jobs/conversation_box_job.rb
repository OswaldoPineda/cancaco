class ConversationBoxJob < ApplicationJob
  queue_as :conversations

  def perform(message_id)
    @message = Message.find(message_id)
    @conversation = Conversation.find(@message.conversation_id)
    @unread_messages = @conversation.messages.where('read = ? AND user_id = ?', false, @message.user_id)

    ChatChannel.broadcast_to("chat:#{@message.recipient_id}",
                             conversation: @conversation,
                             message: @message,
                             size: @unread_messages.size)
  end
end
