require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
   Steps 'Being welcomed' do
     Given 'I am on the landing page' do
       visit '/'
     end
     Then 'I can see a welcome message' do
       expect(page).to have_content("Concerts")
     end
   end
 end
    # Testing for sign in and sign up button
 context 'Going to a website and being welcomed' do
   Steps 'click sign up button' do
     Given 'Give that I am on the landing page' do
     visit '/'
   end
     Then 'I can see sign Up or Sign In' do
     expect(page).to have_content('Join with Email')
     click_link 'Join with Email'
   end
   end
 end
end
