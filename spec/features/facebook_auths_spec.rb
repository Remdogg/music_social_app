# require 'rails_helper'
# TODO Code has been tested and works, but need to retest after app deployed*****

# RSpec.feature "OmniauthTests", js:true, type: :feature do
#  context 'Signing up, then signing in with Facebook' do
#    Steps 'Go to index page to sign up with Facebook' do
#      Given 'I am on the home page and click the Sign In with Facebook link' do
#        visit '/'
#        click_link 'Sign in with Facebook'
#      end
#      Then 'I am taken to the Facebook sign up page, and I sign in' do
#        fill_in 'email', with: 'iglisten.me@gmail.com'
#        fill_in 'pass', with: 'twinkletwinkle'
#        click_button 'Log In'
#      end
#      Then 'I expect to be signed up with my Facebook account' do
#        save_and_open_page
#        expect(page).to have_content("Successfully authenticated from Facebook account.")
#      end
#      Then 'I can sign out, then sign back in with my Facebook account' do
#        click_link 'Sign Out'
#        click_link 'Sign in with Facebook'
#        expect(page).to have_content("Successfully authenticated from Facebook account.")
#      end
#    end # ends steps
#  end # ends context
#
# end # ends rspec
