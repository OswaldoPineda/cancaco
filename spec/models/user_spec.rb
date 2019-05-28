require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Presence of fields' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
  describe 'Validates lenght of fields' do
    it { should validate_length_of(:first_name).is_at_least(2) }
    it { should validate_length_of(:last_name).is_at_least(2) }
    it { should validate_length_of(:first_name).is_at_most(50) }
    it { should validate_length_of(:last_name).is_at_most(50) }
  end
  describe 'Validates association' do
    it { should have_one(:company) }
  end
end
