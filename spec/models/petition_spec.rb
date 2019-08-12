require 'rails_helper'

RSpec.describe Petition, type: :model do
  describe 'valid presence of fields' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:deadline) }
  end

  describe 'valid relations' do
    it { should belong_to(:category) }
    it { should belong_to(:company) }
  end
end
