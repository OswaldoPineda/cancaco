require 'rails_helper'

RSpec.feature 'Catalog of the search', type: :feature do
  given(:user) { create(:user) }
  given(:company) { create(:company, user: user) }
  given!(:category) { create(:category, title: 'Hogar') }
  given!(:category_empty) { create(:category, title: 'Empty') }
  given!(:subcategory) { create(:subcategory, category_id: category.id, title: 'Cocina') }
  given!(:subcategory_empty) { create(:subcategory, category_id: category.id, title: 'Empty') }
  given(:petitioner_company) { create(:company, user: user, category: category) }
  given(:measure) { create(:measure) }
  given(:petition) {
    create(:petition, company: petitioner_company, category: category,
                      subcategory_id: subcategory.id, measure: measure)
  }

  before do
    user.confirm
    sign_in user
    visit root_path
    find(:xpath, "//a[@href='#{search_catalogs_path}']").click
    petition
  end

  context 'Select Categorías option' do
    scenario 'User is signed in' do
      expect(page).to have_content('Categorías para compra y ventas')
    end

    scenario 'User is not signed in', :sign_out do
      expect(page).to have_content('Categorías')
    end
  end

  context 'Select category of catalog' do
    scenario 'Exist a purchase or a sale' do
      page.first(:xpath, "//a[@href='#{category_searches_path(title: category.title)}']").click
      expect(page).to have_content('Responder solicitud')
    end

    scenario 'No exist a purchase or a sale' do
      page.first(:xpath, "//a[@href='#{category_searches_path(title: category_empty.title)}']").click
      expect(page).to have_content('No hay publicaciones que coincidan con tu búsqueda.')
    end
  end

  context 'Select subcategory of catalog' do
    scenario 'Exist a purchase or a sale' do
      page.first(:xpath, "//a[@href='#{subcategory_searches_path(title: subcategory.title)}']").click
      expect(page).to have_content('Responder solicitud')
    end

    scenario 'No exist a purchase or a sale' do
      page.first(:xpath,
                 "//a[@href='#{subcategory_searches_path(title: subcategory_empty.title)}']").click
      expect(page).to have_content('No hay publicaciones que coincidan con tu búsqueda.')
    end
  end
end
