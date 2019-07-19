require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  before do
    visit '/'
  end

  scenario 'logo canaco' do
    find(:xpath, "//div[@class='logo pl-1 pl-md-3 pl-lg-4 pl-xl-5']").click
    expect(current_path).to eq(root_path)
  end

  scenario 'click on characteristics dropdown' do
    find(:xpath, "//span[@id='dropdownCategories']").click
    expect(page).to have_content('Categorías')
  end

  scenario 'search in searchbar' do
    fill_in "Busca productos, servicios y más...",	with: "this is a simple search."
    find(:xpath, "//button[@id='search-btn']")
  end

  scenario 'shopping cart' do
    find(:xpath, "//a[@href='/cart']")
  end

  scenario 'notification bell dropdown' do
    find(:xpath, "//div[@id='dropdownNotification']").click
    expect(page).to have_content('Notificaciones')
    expect(page).to have_content('Ver todo')
  end

  scenario 'My profile dropdown' do
    page.first(:xpath, "//span[@id='dropdownUserMenu']").click
    expect(page).to have_content('Mi cuenta')
    expect(page).to have_content('Mi orden')
    expect(page).to have_content('Vender')
    expect(page).to have_content('Compras')
    expect(page).to have_content('Ayuda')
  end
end
