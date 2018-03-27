
require 'rails_helper'

feature 'User signs in' do 
  
  scenario 'with valid email and password' do
  sign_in_with '123@gmail.com', '123'
  expect(page).to have_content('Logout')
  expect(page).to have_content('Welcome to EazyRecipe')
  end

  scenario 'with invalid email' do 
    sign_in_with 'aidid', '123'
    expect(page).to have_content('Login')
    end

  scenario 'with blank password' do 
    sign_in_with '123@gmail.com', ''
    expect(page).to have_content('Login')
      end

    def sign_in_with(email,password)
      visit sign_in_path
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Login'
    end

end


