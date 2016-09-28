require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'Going to Users index page' do
   Steps 'See all users' do
     Given 'I am on users page' do
      user = User.create! :email => 'remy@gmail.com', :password => 'Remy68', :password_confirmation => 'Remy68', :first_name => 'Remy', :last_name => 'Tan', :age => '27', :gender => 'Male', :city => 'Garden Grove', :state =>"CA", :postal_code => '90680', :about => 'Cool', :artists => 'TayTay'
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
   end
  end
end
