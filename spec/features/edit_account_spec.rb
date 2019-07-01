# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit', type: :feature do
  given(:category) { create(:category, title: 'Hogar') }
  given!(:company) { create(:company, category_id: category.id) }
  given!(:user) { create(:user, company_id: company.id) }

  background do
    user.confirm
    sign_in user
    visit edit_user_registration_path
  end

  scenario 'validates name update' do
    fill_in 'user[full_name]', with: 'Alan Anguiano Ramirez'
    fill_in 'user[current_password]', with: user.password
    click_on 'Guardar cambios'
    expect(page).to have_content('Ha actualizado tu cuenta correctamente')
  end

  scenario 'validates password required' do
    fill_in 'user[full_name]', with: 'Alan Anguiano Ramirez'
    click_on 'Guardar cambios'
    expect(page).not_to have_content('Ha actualizado tu cuenta correctamente')
  end

  scenario 'validates password update' do
    fill_in 'user[password]', with: '654321'
    fill_in 'user[password_confirmation]', with: '654321'
    fill_in 'user[current_password]', with: user.password
    click_on 'Guardar cambios'
    expect(page).to have_content('Ha actualizado tu cuenta correctamente')
  end
end
