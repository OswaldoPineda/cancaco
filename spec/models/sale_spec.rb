require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'valid presence of fields' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:extra_info) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:price) }
  end

  describe 'valid relations' do
    it { should belong_to(:category) }
    it { should belong_to(:company) }
  end
end
