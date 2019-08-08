require 'rails_helper'

RSpec.describe ComponentsEvaluationHelper, type: :helper do
  describe '#navbar_and_footer?' do
    it 'The view has footer and navbar' do
      expect(navbar_and_footer?('home_controller', 'index')).to eq(true)
    end

    it 'The view has not footer and navbar' do
      expect(navbar_and_footer?('devise/sessions', 'new')).to eq(false)
    end
  end

  describe '#notice?' do
    it 'The view has notice' do
      expect(notice?('devise/sessions', 'new')).to eq(true)
    end

    it 'The view has not notice' do
      expect(notice?('/confirmations', 'registration')).to eq(false)
    end
  end
end
