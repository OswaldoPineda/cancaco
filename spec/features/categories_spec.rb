require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  given(:user) { create(:user) }

  background(:each) do |scenario|
    user.confirm
    sign_in user unless scenario.metadata[:sign_out]
    visit categories_path
  end

  scenario 'user is not signed in', :sign_out do
    expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
  end

  scenario 'User is signed in' do
    expect(page).to have_content('¿Qué estás buscando?')
  end
end
