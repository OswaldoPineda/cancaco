require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validate presences of fields' do
    it { should validate_presence_of :title }
  end

  describe 'Validate association' do
    it { should have_many(:subcategories) }
  end
end
