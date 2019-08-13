require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  given(:user) { create(:user) }
  given(:company) { create(:company, user: user) }
  given!(:category) { create(:category, title: 'Tecnología') }
  given!(:subcategory) { create(:subcategory, title: 'Telefonia', category: category) }

  background(:each) do |scenario|
    user.confirm
    sign_in user unless scenario.metadata[:sign_out]
  end

  context 'sales proccess' do
    background { visit categories_sales_path }

    scenario 'have a category card' do
      expect(page).to have_content(category.title)
    end

    scenario 'redirect to select subcategory' do
      find("a[href='#{subcategories_sales_path(id: category.id)}']").click
      expect(page).to have_content('Elige una subcategoría')
    end

    scenario 'user is not signed in', :sign_out do
      expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
    end
  end

  context 'petitions proccess' do
    background { visit categories_petitions_path }

    scenario 'have a category card' do
      expect(page).to have_content(category.title)
    end

    scenario 'redirect to select subcategory' do
      find("a[href='#{subcategories_petitions_path(id: category.id)}']").click
      expect(page).to have_content('Elige una subcategoría')
    end

    scenario 'user is not signed in', :sign_out do
      expect(page).to have_content('Necesita iniciar sesión o registrarse para continuar.')
    end
  end
end
