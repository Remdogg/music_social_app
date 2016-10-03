require 'rails_helper'

RSpec.feature "ConcertPages", type: :feature do
  context 'Going to Sign up page' do
   Steps 'Sign up' do
     Given 'I am on the sign up page' do
       visit '/users/sign_up'
     end
     Then 'I can see a sign up form' do
       expect(page).to have_content('Sign up')
     end
   end
 end
 # filling up sign up form
  context 'Signing up' do
    Steps 'Sign up' do
      Given 'That I can see the sign up form' do
        visit '/users/sign_up'
      end
      Then 'I can fill in the form' do
        fill_in 'user_first_name', with: 'Taylor'
        fill_in 'user_last_name', with: 'swift'
        fill_in 'user_email', with: 'taylor@email.com'
        fill_in 'user_password', with: 'test123'
        fill_in 'user_password_confirmation', with: 'test123'

        click_button 'Sign up'
        expect(page).to have_content('You have signed up successfully')
      end
      Then 'I can log out' do
        click_link 'Logout'
        expect(page).to have_content('Signed out successfully')
      end
      Then 'I can sign in' do
        click_link 'Sign In'
        fill_in 'user_email', with: 'taylor@email.com'
        fill_in 'user_password', with: 'test123'
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully')
      end
        Then 'I can create a concert' do
          click_link 'New Concert'
          fill_in 'concert_title', with: 'T Swift - September 2016'
          fill_in 'concert_artist', with: 'Taylor Swift'
          fill_in 'concert_city', with: 'San Diego'
          fill_in 'concert_state', with: 'CA'
          click_button 'Create Concert'
          expect(page).to have_content('T Swift - September 2016')
          expect(page).to have_content('Taylor Swift')
          expect(page).to have_content('San Diego')
          expect(page).to have_content('CA')
        end
      Then 'I can create a bandtogether after going to my profile page' do
        click_link('My Profile')
        fill_in 'bandtogether_title', with: 'Beast mode'
        fill_in 'bandtogether_start_time', with: '1pm'
        fill_in 'bandtogether_end_time', with: '10pm'
        fill_in 'bandtogether_description', with: 'let loose'
        click_button 'Create Bandtogether'
        expect(page).to have_content('Beast mode')
        expect(page).to have_content('1pm')
        expect(page).to have_content('10pm')
        expect(page).to have_content('let loose')
      end
      Then 'I can create another bandtogether' do
        click_link('Back')
        click_link('New Bandtogether')
        fill_in 'bandtogether_title', with: 'I got 3 spots in my car'
        fill_in 'bandtogether_start_time', with: '3pm'
        fill_in 'bandtogether_end_time', with: '5pm'
        fill_in 'bandtogether_description', with: 'lets party'
        click_button 'Create Bandtogether'
        expect(page).to have_content('I got 3 spots in my car')
        expect(page).to have_content('3pm')
        expect(page).to have_content('5pm')
        expect(page).to have_content('lets party')
      end
      Then 'Go back to see a list of all bandtogethers' do
        click_link 'Back'
        expect(page).to have_content('I got 3 spots in my car')
        expect(page).to have_content('Beast mode')
      end
      Then 'I go to a concert page' do
        visit '/concerts'
        click_link 'Show'
        click_link 'Beast mode'
        expect(page).to have_content('Beast mode')
        expect(page).to have_content('1pm')
        expect(page).to have_content('10pm')
        expect(page).to have_content('let loose')
        expect(page).to have_content('T Swift')
      end
    end
  end
end
