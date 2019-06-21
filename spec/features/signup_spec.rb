# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  given(:user) { FactoryBot.create(:user) }
  given(:company_id) { 'user[company_attributes]' }
  given(:address_id) { 'user[company_attributes][address_attributes]' }
  background do
    visit root_path
    visit new_user_registration_path
  end

  scenario 'Sign up with valid values' do
    fill_in 'user[full_name]', with: 'Oswaldo'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    fill_company_fields(
      affiliation: '1234567890',
      name: 'Magmalabs'
    )
    fill_address_fields(
      zip_code: '29000',
      city: 'Colima',
      state: 'Colima',
      neighborhood: 'Centro',
      street: 'Aldama'
    )
    click_on 'Crear tu cuenta'
    expect(current_path).not_to eq(new_user_registration_path)
  end

  scenario 'Sign up with email already taken' do
    fill_in 'user[full_name]', with: 'Oswaldo Pineda Rivera'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    fill_company_fields(
      affiliation: '1234567890',
      name: 'Magmalabs'
    )
    fill_address_fields(
      zip_code: '29000',
      city: 'Colima',
      state: 'Colima',
      neighborhood: 'Centro',
      street: 'Aldama'
    )
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a very short password' do
    fill_in 'user[full_name]', with: 'Oswaldo'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '1234'
    fill_in 'user[password_confirmation]', with: '1234'
    fill_company_fields(
      affiliation: '1234567890',
      name: 'Magmalabs'
    )
    fill_address_fields(
      zip_code: '29000',
      city: 'Colima',
      state: 'Colima',
      neighborhood: 'Centro',
      street: 'Aldama'
    )
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a within invalid password confirmation' do
    fill_in 'user[full_name]', with: 'Oswaldo'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '1234567'
    fill_company_fields(
      affiliation: '1234567890',
      name: 'Magmalabs'
    )
    fill_address_fields(
      zip_code: '29000',
      city: 'Colima',
      state: 'Colima',
      neighborhood: 'Centro',
      street: 'Aldama'
    )
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a blank fields' do
    fill_in 'user[full_name]', with: 'Oswaldo'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    expect(current_path).to eq(new_user_registration_path)
  end

  def fill_company_fields(*params)
    fill_in "#{company_id}[affiliation]", with: params[0][:affiliation]
    fill_in "#{company_id}[name]", with: params[0][:name]
  end

  def fill_address_fields(*params)
    fill_in "#{address_id}[zip_code]", with: params[0][:zip_code]
    fill_in "#{address_id}[city]", with: params[0][:city]
    fill_in "#{address_id}[state]", with: params[0][:state]
    first('#neighborhood option', minimum: 1).select_option
    fill_in "#{address_id}[street]", with: params[0][:street]
  end
end
