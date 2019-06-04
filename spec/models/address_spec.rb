require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Presence of fields' do
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:outdoor_number) }    
  end
  describe 'Validate association' do
    it { should belong_to(:company) }
  end
end
