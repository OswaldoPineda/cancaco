require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe 'validates associations' do
    it { should belong_to(:sender) }
    it { should belong_to(:recipient) }
  end
end
