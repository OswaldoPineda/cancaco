require 'rails_helper'

RSpec.feature 'Request form', type: :feature do
  given(:category) { create(:category, title: 'Tecnología') }
  given(:company) { create(:company, category_id: category.id) }
  given(:user) { create(:user, company_id: company.id) }
  given!(:subcategory) { create(:subcategory, category_id: category.id) }
  given!(:measure) { create(:measure) }

  before do
    user.confirm
    sign_in user
    visit new_petition_path(category: category, subcategory: subcategory)
  end

  scenario 'show category and subcategory name' do
    expect(page).to have_content(category.title.to_s)
    expect(page).to have_content(subcategory.title.to_s)
  end

  scenario 'fill valid form' do
    fill_in 'petition_title', with: 'I need something'
    fill_in 'petition_description', with: 'I describe a product that I need'
    fill_in 'petition_quantity', with: '3'
    find("#petition_measure_id option[value = #{measure.id}]").select_option
    first('#petition_deadline option', minimum: 1).select_option
    click_button 'Solicitar'
    expect(page).to have_content('Su solicitud ha sido publicada correctamente.')
  end

  scenario 'fill without a field' do
    fill_in 'petition_title', with: 'I need something'
    fill_in 'petition_description', with: 'I describe a product that I need'
    click_button 'Solicitar'
    expect(page).to have_content('Este campo no puede estar en blanco.')
  end
end
