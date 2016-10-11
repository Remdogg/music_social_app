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
        click_link 'Taylor'
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
        user.save
        ability = Ability.new(user)
      end
        Then 'I can create a concert' do
          visit '/concerts'
          click_link 'New Concert'
          fill_in 'concert_title', with: 'T Swift - September 2016'
          fill_in 'concert_artist', with: 'Taylor Swift'
          fill_in 'concert_address', with: '1 main street'
          fill_in 'concert_city', with: 'San Diego'
          fill_in 'concert_state', with: 'CA'
          click_button 'Submit'
          expect(page).to have_content('T Swift - September 2016')
          expect(page).to have_content('Taylor Swift')
          expect(page).to have_content('San Diego')
          expect(page).to have_content('CA')
          concert = Concert.find_by_artist('Taylor Swift')
          concert.id = 1
          concert.save
          concert.start = '2025-10-11'
          concert.save
          concert.end = '2025-10-12'
          concert.save
        end
  #     Then 'I can create a bandtogether from the concert page' do
  #       visit '/concerts'
  #       click_link 'T Swift - September 2016'
  #       save_and_open_page
  #       fill_in 'bandtogether_title', with: 'Beast mode'
  #       fill_in 'bandtogether_start_time', with: '1pm'
  #       fill_in 'bandtogether_end_time', with: '10pm'
  #       fill_in 'bandtogether_description', with: 'let loose'
  #       #TODO assign bandtogether a concert  -can't do through gem chosen
  #       click_button 'Create Bandtogether'
  #       expect(page).to have_content('Beast mode')
  #       expect(page).to have_content('1pm')
  #       expect(page).to have_content('10pm')
  #       expect(page).to have_content('let loose')
  #     end
  #     Then 'I can create another bandtogether' do
  #       click_link('Back to Concert')
  #       fill_in 'bandtogether_title', with: 'I got 3 spots in my car'
  #       fill_in 'bandtogether_start_time', with: '3pm'
  #       fill_in 'bandtogether_end_time', with: '5pm'
  #       fill_in 'bandtogether_description', with: 'lets party'
  #       click_button 'Create Bandtogether'
  #       expect(page).to have_content('I got 3 spots in my car')
  #       expect(page).to have_content('3pm')
  #       expect(page).to have_content('5pm')
  #       expect(page).to have_content('lets party')
  #     end
  #     Then 'Go back to see a list of all bandtogethers' do
  #       visit '/bandtogethers'
  #       expect(page).to have_content('I got 3 spots in my car')
  #       expect(page).to have_content('Beast mode')
  #     end
  #     Then 'I go to a concert page' do
  #       visit '/concerts'
  #       click_link 'T Swift - September 2016'
  #       click_link 'Beast mode'
  #       expect(page).to have_content('Beast mode')
  #       expect(page).to have_content('1pm')
  #       expect(page).to have_content('10pm')
  #       expect(page).to have_content('let loose')
  #       expect(page).to have_content('T Swift')
  #     end
    end
  end
end
