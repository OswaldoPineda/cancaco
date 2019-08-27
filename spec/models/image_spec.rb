require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'valid relations' do
    it { should belong_to(:sale) }
  end
end
