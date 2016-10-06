require 'rails_helper'

RSpec.feature "ProfilePages", type: :feature do
  context 'Edit and view user Profile Page' do
    Steps 'Editing my info' do
      Given 'I am on the Sign In page' do
        visit '/users/sign_up'
      end
      And 'I can signup' do
        fill_in("user_first_name", :with => 'talyor')
        fill_in('user_last_name', :with => 'swift')
        fill_in("user_email", :with => 'star@star.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')
      end
      Then 'I can add information to my user profile' do
        expect(page).to have_content("Edit User")
      end
      And 'I can add my first name, last name, favorite bands, city, state, age, gender, about summary' do
        fill_in("user_first_name", :with => 'Jodi')
        fill_in("user_last_name", :with => 'Pickles')
        fill_in("user_age", :with => '0')
        fill_in("user_gender", :with => 'hamburger')
        fill_in("user_city", :with => 'San Diego')
        fill_in("user_state", :with => 'CA')
        fill_in("user_postal_code", :with => '92020')
        fill_in("user_about", :with => 'kdjgkfjsgjfgskjfds')
        fill_in("user_artists", :with => 'kdjhfsdhfskh')
        fill_in("user_current_password", :with => 'password')
        click_button('Update')
      end
      Then 'I can view my profile page with my information' do
        expect(page).to have_content('Jodi')
        expect(page).to have_content('Pickles')
        expect(page).to have_content('0')
        expect(page).to have_content('hamburger')
        expect(page).to have_content('San Diego')
        expect(page).to have_content('CA')
        expect(page).to have_content('92020')
        expect(page).to have_content('kdjgkfjsgjfgskjfds')
        expect(page).to have_content('kdjhfsdhfskh')

      end
      
      Then 'I can create a bandtogether from my dashboard page' do
        visit '/'
        fill_in("Title", :with => 'Tswizzle')
        fill_in("Start time", :with => '4pm')
        fill_in("End time", :with => 'never')
        fill_in("Description", :with => 'go hard or go home')
        # select('Tswizzle', :from => 'bandtogether_concert_id')
        click_button('Create Bandtogether')

      end
    end
  end




end
