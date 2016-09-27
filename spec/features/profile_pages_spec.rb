require 'rails_helper'

RSpec.feature "ProfilePages", type: :feature do
  context 'Going to user Profile Page' do
    Steps 'Viewing my info' do
      Given 'I am on the Sign In page' do
        visit '/users/sign_up'
      end
      And 'I can signup' do
        fill_in("user_email", :with => 'star@star.com')
        fill_in('user_password', :with => 'password')
        fill_in('user_password_confirmation', :with => 'password')
        click_button('Sign up')

      end
      Then 'I can see my profile page' do
        expect(page).to have_content("My Profile")
      end
    end
  end

end
