class Message < ApplicationRecord
  validates :message, presence: true
  belongs_to :conversation, inverse_of: :messages
  belongs_to :recipient, class_name: :Company
  belongs_to :user

  after_create_commit :send_message, :create_conversation_box

  protected

  def create_conversation_box
    ConversationBoxJob.perform_later(id)
  end

  def send_message
    SendMessagesJob.perform_later(id)
  end
end
