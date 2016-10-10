require 'rails_helper'
require 'support/features_support'

RSpec.feature "Searches", type: :feature do
  context 'Search for specific concert' do
    Steps 'Type into search bar and click search button' do
      Given 'I am signed in' do
        sign_up('test', 'test','test@tesr.com', 'password', 'password')
      end
      Then 'I am given admin priv' do
        user = User.last
        user.add_role :admin
        ability = Ability.new(user)
      end
      Given 'I am on the concert page' do
        visit '/concerts'
      end
      Then 'I can create a concert' do
        click_link 'New Concert'
        fill_in 'concert_title', with: 'T Swift - September 2016'
        fill_in 'concert_artist', with: 'Taylor Swift'
        fill_in 'concert_address', with: '2 main st'
        fill_in 'concert_city', with: 'San Diego'
        fill_in 'concert_state', with: 'CA'
        click_button 'Submit'
        expect(page).to have_content('T Swift - September 2016')
        expect(page).to have_content('Taylor Swift')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('CA')
      end
        Then 'I can go back to the concerts list page' do
        click_link 'Back'
      end
      And 'I can search for concerts' do
        fill_in 'search', with: 'Taylor'
        click_button 'Search'
        expect(page).to have_content('Swift')
        fill_in 'search', with: 'charles'
        click_button 'Search'
        expect(page).to have_no_content('charles')
      end
    end
  end
  context 'Search for a specific User' do
    Steps 'Type into the search bar and click search' do
      Given 'I am on the users page' do
        user = User.create! :email => 'star@star.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Star', :last_name => 'Twinkle', :age => '67', :gender => 'female', :city => 'Orinda', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'
      end
        Then 'I can search a user' do
          Given 'I am signed in' do
            visit '/'
            click_link 'Login'
            fill_in 'user_email', with: 'star@star.com'
            fill_in 'user_password', with: 'password'
            click_button 'Log in'
          end
          visit '/users'
          fill_in 'search', with: 'Twinkle'
          click_button 'Search'
          expect(page).to have_content('Twinkle')
          fill_in 'search', with: 'charles'
          click_button 'Search'
          expect(page).to have_no_content('Twinkle')

        end
    end
  end
end
