require 'rails_helper'

RSpec.describe InvalidFeedbackHelper, type: :helper do
  let(:error_messages) do
    { field: ["It cant be empty.", "The length is so long."] }
  end

  describe "#invalid_feedback_message" do
    it "Obtain the first message" do
      message = invalid_feedback_message(messages: error_messages, field: :field)
      expect(message).to eq("It cant be empty.")
    end
  end
end
