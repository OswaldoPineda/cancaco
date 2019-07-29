# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Search', type: :feature do
  given(:user) { create(:user) }
  given(:category) { create(:category) }
  given(:petitioner_company) { create(:company, user: user, category: category) }
  given!(:recipient_company) { create(:company, category: category) }
  given(:measure) { create(:measure) }
  given(:petition) { create(:petition, company: petitioner_company, category: category, measure: measure) }

  background do
    user.confirm
    sign_in user
    petition
    visit root_path
  end

  scenario 'search an inexistent sale or petition' do
    fill_in 'Busca productos, servicios y más...', with: 'Motor de lancha'
    find(:xpath, "//button[@id='search-btn']").click
    expect(page).to have_content('No hay publicaciones que coincidan con tu búsqueda.')
  end

  scenario 'search a registered sale or petition' do
    fill_in 'Busca productos, servicios y más...', with: 'wheels'
    find(:xpath, "//button[@id='search-btn']").click
    expect(page).to have_content(petition.title)
  end
end
