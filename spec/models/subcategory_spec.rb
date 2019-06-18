require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe 'Validate presences of fields' do
    it { should validate_presence_of :title }
  end

  describe 'Validate association' do
    it { should belong_to(:category) }
  end
end
