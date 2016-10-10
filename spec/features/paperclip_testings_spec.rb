require 'rails_helper'

RSpec.feature "PaperclipTestings", type: :feature do
  context 'As a user I can upload an image avatar' do
    Steps 'I can sign up and/or sign in and upload an avatar' do
      Given 'I am on the homepage' do
        visit '/'
        click_link 'Sign Up'
        fill_in 'user_first_name', with: 'Jodi'
        fill_in 'user_last_name', with: 'Pickles'
        fill_in 'user_email', with: 'Jodi@email.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'Sign up'
        attach_file('user_avatar', File.absolute_path('./spec/assets/remycar.jpg'))
        fill_in("user_first_name", :with => 'Jodi')
        fill_in("user_last_name", :with => 'Pickles')
        fill_in("user_age", :with => '0')
        fill_in("user_gender", :with => 'hamburger')
        fill_in("user_city", :with => 'San Diego')
        fill_in("user_state", :with => 'CA')
        fill_in("user_postal_code", :with => '92020')
        fill_in("user_about", :with => 'kdjgkfjsgjfgskjfds')
        fill_in("user_artists", :with => 'kdjhfsdhfskh')
        click_button('Update')
        expect(page).to have_selector('img')
      end
    end
  end
      context 'As a user I can upload an image for the bandtogether list and show page' do
        Steps 'Sign in and Uuload an image on the bandtogether form' do
          Given 'I am on the homepage' do
            visit '/'
            click_link 'Sign Up'
            fill_in 'user_first_name', with: 'Jodi'
            fill_in 'user_last_name', with: 'Pickles'
            fill_in 'user_email', with: 'Jodi@email.com'
            fill_in 'user_password', with: 'password'
            fill_in 'user_password_confirmation', with: 'password'
            click_button 'Sign up'
            attach_file('user_avatar', File.absolute_path('./spec/assets/remycar.jpg'))
            fill_in("user_first_name", :with => 'Jodi')
            fill_in("user_last_name", :with => 'Pickles')
            fill_in("user_age", :with => '0')
            fill_in("user_gender", :with => 'hamburger')
            fill_in("user_city", :with => 'San Diego')
            fill_in("user_state", :with => 'CA')
            fill_in("user_postal_code", :with => '92020')
            fill_in("user_about", :with => 'kdjgkfjsgjfgskjfds')
            fill_in("user_artists", :with => 'kdjhfsdhfskh')
            click_button('Update')
            expect(page).to have_selector('img')
          end
          Given 'I am on the listing bandtogether page' do
            visit '/bandtogethers'
            click_link 'New Bandtogether'
            attach_file('bandtogether_bandtogether_avatar', File.absolute_path('./spec/assets/remycar.jpg'))
            fill_in 'bandtogether_title', with: 'I got 3 spots in my car'
            fill_in 'bandtogether_start_time', with: '3pm'
            fill_in 'bandtogether_end_time', with: '5pm'
            fill_in 'bandtogether_description', with: 'lets party'
            click_button 'Create Bandtogether'
          end
        end
      end
end
