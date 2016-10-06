require 'rails_helper'

RSpec.feature "BandtogetherPages", type: :feature do
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
        click_link 'Login'
        fill_in 'user_email', with: 'taylor@email.com'
        fill_in 'user_password', with: 'test123'
        click_button 'Log in'
        expect(page).to have_content('Taylor')
      end
      Then 'I am assigned admin priv' do
        user = User.last
        user.add_role :admin
        ability = Ability.new(user)
      end
      Then 'I can create a concert' do
        visit '/concerts'
        click_link 'New Concert'
        fill_in 'concert_title', with: 'T Swift - September 2016'
        fill_in 'concert_artist', with: 'Taylor Swift'
        fill_in 'concert_address', with: 'dfsjkhgfs'
        fill_in 'concert_city', with: 'San Diego'
        fill_in 'concert_state', with: 'CA'
        click_button 'Submit'
        expect(page).to have_content('T Swift - September 2016')
        expect(page).to have_content('Taylor Swift')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('CA')
      end
      Then 'I can create a bandtogether from the concert page' do
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
      Then 'I can add a comment' do
        pending
      end
    end
  end
end
