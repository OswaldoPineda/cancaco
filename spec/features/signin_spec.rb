# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  given(:user) { FactoryBot.create(:user) }

  background do
    visit root_path
    visit new_user_session_path
  end

  scenario 'Sign in with valid user' do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Iniciar sesión'
    expect(current_path).to eq(root_path)
  end

  scenario 'Sign in  with invalid user' do
    fill_in 'user[email]', with: 'fail@test.com'
    fill_in 'user[password]', with: '123456'
    click_on 'Iniciar sesión'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'Sign in with a blank field' do
    fill_in 'user[email]', with: 'fail@test.com'
    click_on 'Iniciar sesión'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'Go to create a new user' do
    click_on 'Crear tu cuenta'
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Should have password recovery' do
    expect(page).to have_link '¿Olvidaste tu contraseña?', href: new_user_password_path
  end
end
