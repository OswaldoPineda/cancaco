module ConversationUsersHelper
  def company_recipient(current_user, conversation)
    if conversation.sender_id == current_user.company.id
      Company.find(conversation.recipient_id)
    else
      Company.find(conversation.sender_id)
    end
  end

  def recipient_or_sender_partial(current_user, conversation)
    if conversation.sender_id == current_user.company.id
      'conversations/subject_info'
    else
      'conversations/sender_info'
    end
  end
end
