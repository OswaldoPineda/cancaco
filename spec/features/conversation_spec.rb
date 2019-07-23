require 'rails_helper'

RSpec.feature 'Chat view', type: :feature do
  let(:user) { create(:user) }

  background(:each) do |scenario|
    user.confirm
    sign_in user unless scenario.metadata[:sign_out]
    visit '/conversation'
  end

  scenario 'user is not signed in', :sign_out do
    expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
  end

  scenario 'Descriptive text' do
    expect(page).to have_content('Opiniones')
  end

  scenario 'Have a button to send' do
    expect(page).to have_selector(:link_or_button, 'Enviar')
  end

  scenario 'Have a button to send' do
    expect(page).to have_selector(:link_or_button, 'Responder solicitud')
  end
end
