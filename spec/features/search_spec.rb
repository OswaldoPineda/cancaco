# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Search', type: :feature do
  given(:user) { create(:user) }
  given(:category) { create(:category, title: 'Tecnologia') }
  given!(:category_empty) { create(:category, title: 'Salud') }
  given!(:subcategory) { create(:subcategory, category_id: category.id, title: 'Computacion') }
  given!(:subcategory_empty) { create(:subcategory, category_id: category.id, title: 'Telefonia') }
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

  context 'search on searbar' do
    scenario 'an inexistent sale or petition' do
      fill_in 'Busca productos, servicios y más...', with: 'Motor de lancha'
      find(:xpath, "//button[@id='search-btn']").click
      expect(page).to have_content('No hay coincidencias con tu búsqueda')
    end

    scenario 'a registered sale or petition' do
      fill_in 'Busca productos, servicios y más...', with: 'wheels'
      find(:xpath, "//button[@id='search-btn']").click
      expect(page).to have_content(petition.title)
    end
  end

  context 'search on searchbar when user is logged out' do
    scenario 'an inexistent sale or petition' do
      sign_out user
      fill_in 'Busca productos, servicios y más...', with: 'Motor de lancha'
      find(:xpath, "//button[@id='search-btn']").click
      expect(page).to have_content('No hay coincidencias con tu búsqueda')
    end

    scenario 'redirect to home' do
      find("a[href='/']").click
      expect(page).to have_content('Categorías')
    end

    scenario 'a registered sale or petition' do
      sign_out user
      fill_in 'Busca productos, servicios y más...', with: 'wheels'
      find(:xpath, "//button[@id='search-btn']").click
      expect(page).to have_content(petition.title)
    end
  end

  context 'search on categories dropdown' do
    scenario 'a category without petitions or sales' do
      find(:xpath, "//span[@id='dropdownCategories']").click
      find(:xpath, "//div[@class='dropdown-submenu']//a[@class='dropdown-item']").click
      expect(page).to have_content('No hay coincidencias con tu búsqueda')
    end

    scenario 'a category with petitions or sales' do
      find(:xpath, "//span[@id='dropdownCategories']").click
      find(:xpath, "//div[@class='dropdown-submenu']//a[@class='dropdown-item dropdown-toggle']").click
      find(:xpath, "//a[@href='#{category_searches_path(title: category.title)}']").click
      expect(page).to have_content(category.title)
    end

    scenario 'a subcategory without petitions or sales' do
      find(:xpath, "//span[@id='dropdownCategories']").click
      find(:xpath, "//div[@class='dropdown-submenu']//a[@class='dropdown-item']").click
      find(:xpath, "//a[@href='#{subcategory_searches_path(title: subcategory_empty.title)}']").click
      expect(page).to have_content('No hay coincidencias con tu búsqueda')
    end

    scenario 'a subcategory with petitions or sales' do
      find(:xpath, "//span[@id='dropdownCategories']").click
      find(:xpath, "//div[@class='dropdown-submenu']//a[@class='dropdown-item dropdown-toggle']").click
      find(:xpath, "//a[@href='#{subcategory_searches_path(title: subcategory.title)}']").click
      expect(page).to have_content(category.title)
    end
  end
end
