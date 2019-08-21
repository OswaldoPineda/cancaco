class MessagesController < ApplicationController
  include MessagesReadHelper
  before_action :authenticate_user!, :load_entities

  def create
    @message = Message.create user: current_user,
                              conversation: @conversation,
                              recipient_id: actual_recipient,
                              message: params.dig(:message, :message)
    mark_as_read(@conversation.messages, current_user.company.id)
  end

  protected

  def actual_recipient
    if current_user.company.id == @conversation.sender_id
      @conversation.recipient_id
    else
      @conversation.sender_id
    end
  end

  def load_entities
    @conversation = Conversation.find params.dig(:message, :conversation_id)
  end
end
