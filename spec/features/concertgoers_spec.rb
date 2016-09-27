require 'rails_helper'

RSpec.feature "Concertgoers", type: :feature do
  context 'Going to concertgoers index page' do
   Steps 'See all users' do
     Given 'I am on concertgoers page' do
      user = User.create! :email => 'remy@gmail.com', :password => 'Remy68', :password_confirmation => 'Remy68'
       visit '/concertgoers/index'
     end
     Then 'I can see a list of users' do
       expect(page).to have_content('remy@gmail.com')
     end
   end
  end
end
