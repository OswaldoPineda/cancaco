module InvalidFeedbackHelper
  def invalid_feedback_message(messages:, field:)
    messages[field].first.presence
  end
end
