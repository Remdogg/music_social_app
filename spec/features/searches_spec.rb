require 'rails_helper'

RSpec.feature "Searches", type: :feature do
  context 'Search for specific concert' do
    Steps 'Type into search bar and click search button' do
      Given 'I am on the concert page' do
        visit '/'
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
        Then 'I can go back to the concerts list page' do
        click_link 'Back'
      end
      And 'I can search for conerts' do
        fill_in 'search', with: 'Taylor'
        click_button 'Search'
        expect(page).to have_content('Taylor Swift')
        fill_in 'search', with: 'charles'
        click_button 'Search'
        expect(page).to have_no_content('charles')
      end
    end
  end
  context 'Seach for a specific User' do
    Steps 'Type into the search bar and click search' do
      Given 'I am on the users page' do
        user = User.create! :email => 'star@star.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Star', :last_name => 'Twinkle', :age => '67', :gender => 'female', :city => 'Orinda', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'
        visit '/users'
      end
        Then 'I can search a user' do
          fill_in 'search', with: 'Star'
          click_button 'Search'
          expect(page).to have_content('Star')
          fill_in 'search', with: 'charles'
          click_button 'Search'
          expect(page).to have_no_content('Star')

        end
    end
  end
end
