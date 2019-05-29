# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  given(:user) { FactoryBot.create(:user) }
  given(:company_id) { 'user[company_attributes]' }
  given(:addres_id) { 'user[company_attributes][address_attributes]' }
  background do
    visit root_path
    visit new_user_registration_path
  end

  scenario 'Sign up with valid values' do
    fill_in 'user[first_name]', with: 'Oswaldo'
    fill_in 'user[last_name]', with: 'Pineda Rivera'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    fill_company_fields([
                          affiliation: '123456789',
                          name: 'Magmalabs',
                          phone: '1234567',
                          cellphone: '1234567890'
                        ])
    fill_address_fields([
                          zip_code: '29000',
                          city: 'Colima',
                          state: 'Colima',
                          neighborhood: 'Centro',
                          street: 'Aldama',
                          outdoor_number: '123'
                        ])
    click_on 'Crear tu cuenta'
    expect(current_path).not_to eq(new_user_registration_path)
  end

  scenario 'Sign up with email already taken' do
    fill_in 'user[first_name]', with: 'Oswaldo'
    fill_in 'user[last_name]', with: 'Pineda Rivera'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    fill_company_fields([
                          affiliation: '123456789',
                          name: 'Magmalabs',
                          phone: '1234567',
                          cellphone: '1234567890'
                        ])
    fill_address_fields([
                          zip_code: '29000',
                          city: 'Colima',
                          state: 'Colima',
                          neighborhood: 'Centro',
                          street: 'Aldama',
                          outdoor_number: '123'
                        ])
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a very short password' do
    fill_in 'user[first_name]', with: 'Oswaldo'
    fill_in 'user[last_name]', with: 'Pineda Rivera'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '1234'
    fill_in 'user[password_confirmation]', with: '1234'
    fill_company_fields([
                          affiliation: '123456789',
                          name: 'Magmalabs',
                          phone: '1234567',
                          cellphone: '1234567890'
                        ])
    fill_address_fields([
                          zip_code: '29000',
                          city: 'Colima',
                          state: 'Colima',
                          neighborhood: 'Centro',
                          street: 'Aldama',
                          outdoor_number: '123'
                        ])
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a within invalid password confirmation' do
    fill_in 'user[first_name]', with: 'Oswaldo'
    fill_in 'user[last_name]', with: 'Pineda Rivera'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '1234567'
    fill_company_fields([
                          affiliation: '123456789',
                          name: 'Magmalabs',
                          phone: '1234567',
                          cellphone: '1234567890'
                        ])
    fill_address_fields([
                          zip_code: '29000',
                          city: 'Colima',
                          state: 'Colima',
                          neighborhood: 'Centro',
                          street: 'Aldama',
                          outdoor_number: '123'
                        ])
    expect(current_path).to eq(new_user_registration_path)
  end

  scenario 'Sign up with a blank fields' do
    fill_in 'user[first_name]', with: 'Oswaldo'
    fill_in 'user[last_name]', with: 'Pineda Rivera'
    fill_in 'user[email]', with: 'new@test.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    expect(current_path).to eq(new_user_registration_path)
  end

  def fill_company_fields(*)
    fill_in "#{company_id}[affiliation]", with: 'params[:affiliation]'
    fill_in "#{company_id}[name]", with: 'params[:name]'
    fill_in "#{company_id}[phone]", with: 'params[:phone]'
    fill_in "#{company_id}[cellphone]", with: 'params[:cellphone]'
  end

  def fill_address_fields(*)
    fill_in "#{addres_id}[zip_code]", with: 'params[:zip_code]'
    fill_in "#{addres_id}[zip_code]", with: 'params[:zip_code]'
    fill_in "#{addres_id}[city]", with: 'params[:city]'
    fill_in "#{addres_id}[state]", with: 'params[:state]'
    fill_in "#{addres_id}[neighborhood]", with: 'params[:neighborhood]'
    fill_in "#{addres_id}[street]", with: 'params[:street]'
    fill_in "#{addres_id}[outdoor_number]", with: 'params[:outdoor_number]'
  end
end
