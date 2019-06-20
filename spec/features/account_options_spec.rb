require 'rails_helper'

RSpec.feature 'Account options', type: :feature do
  given(:user) { create(:user) }

  background(:each) do |scenario|
    user.confirm
    sign_in user unless scenario.metadata[:sign_out]
    visit '/users/account_options'
  end

  scenario 'user is not signed in', :sign_out do
    expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
  end

  scenario 'User is signed in' do
    expect(page).to have_content("Hola #{user.full_name}!")
  end

  scenario "Click 'mis datos' option" do
    find(:xpath, "//a[@name='MisDatos']").click
    expect(page).to have_content('Edit User')
  end
end
