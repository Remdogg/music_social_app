require 'rails_helper'
RSpec.feature "Dashboards", type: :feature do

  context 'going to dashboard' do
    PublicActivity.with_tracking do
    Steps 'Sign in and be directed to dashboard' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'Star can sign in' do
        user = User.create! :email => 'star@star.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Star', :last_name => 'Twinkle', :age => '67', :gender => 'female', :city => 'Orinda', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'
        visit '/'
        click_link 'Login'
        fill_in 'user_email', with: 'star@star.com'
        fill_in 'user_password', with: 'password'
        click_button 'Log in'
      end
      And 'Star is redirected to her dashboard page' do
        expect(page).to have_content('Star')
        click_link 'Logout'
      end
      Then 'We can create another user' do
        user = User.create! :email => 'amy@amy.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Amy', :last_name => 'Pickles', :age => '63', :gender => 'female', :city => 'Auburn', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'
        click_link 'Login'
        fill_in 'user_email', with: 'amy@amy.com'
        fill_in 'user_password', with: 'password'
        click_button 'Log in'
      end
      Then 'Amy is assigned admin priv' do
          user = User.last
          user.add_role :admin
          ability = Ability.new(user)
          end
      Then 'Amy can create a concert' do
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
        end
        Then 'Amy can create a bandtogether after going to her dashboard page' do
          visit '/'
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
        Then 'Amy can log out' do
          click_link 'Logout'
        end
        Then 'Star can sign in' do
          visit '/'
          click_link 'Login'
          fill_in 'user_email', with: 'star@star.com'
          fill_in 'user_password', with: 'password'
          click_button 'Log in'
        end
        Then 'Star can follow the other user (Amy)' do
          visit '/users'
          click_link ('Amy Pickles')
          click_button ('Follow')
          click_link "Logout"
        end
        Then 'Amy can sign in and create a new b2g' do
          visit '/'
          click_link 'Login'
          fill_in 'user_email', with: 'amy@amy.com'
          fill_in 'user_password', with: 'password'
          click_button 'Log in'
          fill_in 'bandtogether_title', with: 'Beast mode'
          fill_in 'bandtogether_start_time', with: '1pm'
          fill_in 'bandtogether_end_time', with: '10pm'
          fill_in 'bandtogether_description', with: 'let loose'
          click_button 'Create Bandtogether'
          expect(page).to have_content('Beast mode')
          expect(page).to have_content('1pm')
          expect(page).to have_content('10pm')
          expect(page).to have_content('let loose')
          click_link 'Logout'
        end
        Then 'Star can sign in and see Amys activity on her dashboard' do
          # TODO fix test for gem
          # visit '/'
          # click_link 'Login'
          # fill_in 'user_email', with: 'star@star.com'
          # fill_in 'user_password', with: 'password'
          # click_button 'Log in'
          # visit '/'
          # expect(page).to have_content "Amy added beast mode to T Swift - September 2016"
          # save_and_open_page
          end
    end
  end
end
end
