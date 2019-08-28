require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Presence of fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:affiliation).on(:create) }
  end
  describe 'Validates length of fields' do
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_length_of(:affiliation).is_equal_to(10).on(:create) }
  end
  describe 'Validate association' do
    it { should have_many(:addresses) }
  end
end
