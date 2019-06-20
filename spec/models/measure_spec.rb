require 'rails_helper'

RSpec.describe Measure, type: :model do
  describe 'presence of fields' do
    it { should validate_presence_of(:name) }
  end
end
