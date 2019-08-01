class SendMessagesJob < ApplicationJob
  queue_as :messages

  def perform(message_id)
    @message = Message.find(message_id)
    @conversation = Conversation.find(@message.conversation_id)

    ConversationChannel.broadcast_to(@conversation, @message)
  end
end
