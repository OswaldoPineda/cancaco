require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it { should belong_to(:conversation) }
    it { should belong_to(:user) }
  end

  describe 'message not empty' do
    it { should validate_presence_of(:message) }
  end
end
