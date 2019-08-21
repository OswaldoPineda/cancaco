module MessagesReadHelper
  def mark_as_read(conversation, company_id)
    conversation.each do |message|
      next unless message.recipient_id == company_id

      unless message.read
        message.update(read: true)
      end
    end
  end
end
