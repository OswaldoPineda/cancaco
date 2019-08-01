require 'rails_helper'

RSpec.feature 'Chat view', type: :feature do
  given(:user) { create(:user) }
  given(:category) { create(:category, title: 'tecnologia') }
  given!(:subcategory) { create(:subcategory, category: category) }
  given(:company_sender) { create(:company, category: category) }
  given(:company_recipient) { create(:company, category: category) }

  background(:each) do |scenario|
    user.confirm
    sign_in user unless scenario.metadata[:sign_out]
    visit '/conversations'
  end

  scenario 'user is not signed in', :sign_out do
    expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
  end

  scenario 'Not conversations to show' do
    expect(page).to have_content('No hay conversaciones.')
  end

  scenario 'Any chat selected' do
    expect(page).to have_content('No hay ningun chat seleccionado')
  end
end
