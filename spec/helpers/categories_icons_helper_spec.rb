require 'rails_helper'

RSpec.describe CategoriesIconsHelper, type: :helper do
  let(:category_title) { 'tecnologia' }
  let(:title_invalid) { 'invalid' }

  describe '#load_image' do
    context 'return the image tag' do
      subject { helper.load_image(category_title) }
      img = /<img class="image" src="\/assets\/categories\/tecnologia-.+.png" \/>/
      it { expect(subject).to match(img) }
    end

    context 'return error message' do
      subject { helper.load_image(title_invalid) }
      it { expect(subject).to eq(I18n.t('errors.messages.not_found_image')) }
    end
  end
end
