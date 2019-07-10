require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'validates association' do
    it { should belong_to(:company) }
    it { should belong_to(:recipient) }
    it { should belong_to(:notifiable) }
  end
end
