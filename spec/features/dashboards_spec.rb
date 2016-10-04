require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do

  context 'going to dashboard' do
    Steps 'Sign in and be directed to dashboard' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I sign in' do
        user = User.create! :email => 'star@star.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Star', :last_name => 'Twinkle', :age => '67', :gender => 'female', :city => 'Orinda', :state => 'CA', :postal_code => '94563', :about => 'tight AF', :artists => '2chainz'
        visit '/'
        click_link 'Login'
        fill_in 'user_email', with: 'star@star.com'
        fill_in 'user_password', with: 'password'
        click_button 'Log in'
      end
      And 'I am redirected to my dashboard page' do
        expect(page).to have_content('Star Twinkle')
      end
    end
  end

end
