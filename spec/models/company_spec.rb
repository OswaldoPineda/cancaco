require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Presence of fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:affiliation) }
  end
  describe 'Validates length of fields' do
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_length_of(:phone).is_equal_to(7) }
    it { should validate_length_of(:cellphone).is_at_most(10) }
    it { should validate_length_of(:affiliation).is_equal_to(10) }
  end
  describe 'Validate only numbers' do
    it 'Should be a correct phone number' do
      company = build(:company)
      expect(company).to be_valid
    end
    it 'Should be an incorrect phone number' do
      company = build(:company, phone: '31g292')
      expect(company).not_to be_valid
    end
    it 'Should be a correct cellphone number' do
      company = build(:company)
      expect(company).to be_valid
    end
    it 'Should be an incorrect cellphone number' do
      company = build(:company, cellphone: '312a102741')
      expect(company).not_to be_valid
    end
  end
  describe 'Validate association' do
    it { should belong_to(:user) }
    it { should have_one(:address) }
  end
end
