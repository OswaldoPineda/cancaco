require 'rails_helper'

RSpec.feature 'Request form', type: :feature do
  given(:category) { create(:category, title: 'Tecnología') }
  given(:company) { create(:company, category_id: category.id) }
  given!(:address) { create(:address, company: company) }
  given!(:address_two) { create(:address, company: company) }
  given(:user) { create(:user, company_id: company.id) }

  before do
    user.confirm
    sign_in user
    visit addresses_path
  end

  scenario 'Show the main page' do
    expect(page).to have_content('Agregar dirección')
  end

  scenario 'Add a new address' do
    find(:xpath, '//a[@id="addAddress"]')
    fill_in 'zip_code', with: '28000'
    fill_in 'state', with: 'Colima'
    fill_in 'city', with: 'Colima'
    fill_in 'street', with: 'test street'
    click_on 'Agregar'
    expect(page).to have_content('Dirección agregada correctamente.')
  end

  scenario 'Editing an address' do
    fill_in "street_edit_#{address.id}", with: 'New existing street'
    find(:xpath, "//*[@id='edit-#{address.id}-btn']").click
    expect(page).to have_content('Dirección actualizada.')
  end

  scenario 'Deleting an address' do
    first(:link, 'Eliminar')
    find(:xpath, "//*[@id='delete-#{address.id}-btn']").click
    expect(page).to have_content('Dirección borrada.')
  end
end
