require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Going to Users index page' do
   Steps 'See all users' do
     Given 'I am on users page' do
      user = User.create! :email => 'remy@gmail.com', :password => 'Remy68', :password_confirmation => 'Remy68', :first_name => 'Remy', :last_name => 'Tan', :age => '27', :gender => 'Male', :city => 'Garden Grove', :state =>"CA", :postal_code => '90680', :about => 'Cool', :artists => 'TayTay'
      user = User.create! :email => 'jack@email.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Jack', :last_name => 'Fern', :age => '27', :gender => 'Male', :city => 'San Diego', :state =>"CA", :postal_code => '92122', :about => 'Cool AF', :artists => 'TaySwizz'
        visit '/users'
     end
     Then 'I can see a list of users' do
       expect(page).to have_content('Remy Tan')
     end
     Then 'I can click on a user' do
      click_link('Remy Tan')
      expect(page).to have_content('Remy')
      expect(page).to have_content('Tan')
      expect(page).to have_content('Male')
      expect(page).to have_content('Garden Grove')
      expect(page).to have_content('CA')
      expect(page).to have_content('90680')
      expect(page).to have_content('Cool')
      expect(page).to have_content('TayTay')
     end
     Then 'I can sign in' do
       click_link('Sign In')

        fill_in 'user_email', with: 'remy@gmail.com'
        fill_in 'user_password', with: 'Remy68'
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully')
     end
     Then 'I can show users' do
      visit '/users'
      end
      Then 'I can click on other users' do
        click_link('Jack Fern')
      end
      Then 'I can click on the follow button' do
        click_button 'Follow'
        expect(page).to have_content('1 followers')
      end
      Then 'I can click on the unfollow button' do
        click_button 'Unfollow'
        expect(page).to have_content('0 followers')
      end
      Then 'I can click on the follow button' do
        click_button 'Follow'
        expect(page).to have_content('1 followers')
      end
      Then 'I can click on the followers' do
        click_link '1 followers'
        expect(page).to have_content('remy@gmail.com')
      end
      Then 'I can logout' do
        click_link 'Logout'
      end
      Then 'I can sign in' do
        click_link('Sign In')
         fill_in 'user_email', with: 'jack@email.com'
         fill_in 'user_password', with: 'password'
         click_button 'Log in'
         expect(page).to have_content('Signed in successfully')
      end
      Then 'I can show users' do
          visit '/users'
      end
      Then 'I can click on other users' do
         click_link('Remy Tan')
         expect(page).to have_content('1 following')
      end
      Then 'I can see who he is following' do
        click_link('1 following')
        expect(page).to have_content('jack@email.com')
      end
   end
  end
end
