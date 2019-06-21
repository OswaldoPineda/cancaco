require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Presence of fields' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
  describe 'Validates lenght of fields' do
    it { should validate_length_of(:last_name).is_at_least(2) }
    it { should validate_length_of(:last_name).is_at_most(50) }
  end
  describe 'Validates association' do
    it { should have_one(:company) }
  end

  context 'validates email format' do
    let(:user) { create(:user, email: email) }

    context 'with invalid email' do
      let(:email) { 'invalid' }

      it 'throws an exception' do
        expect{ user.save! }.to raise_error("La validación falló: Correo es inválido")
      end
    end

    context 'with valid email' do
      let(:email) { 'valid-email@example.com' }

      it 'creates the user' do
        expect(user.save!).to eq(true)
      end
    end
  end
end
