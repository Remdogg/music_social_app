require 'rails_helper'
require 'support/features_support'

RSpec.feature "Messagings", type: :feature do
  context 'Sending Message' do
   Steps 'Send a message' do
     Given 'I am signed in' do
       sign_up('jack', 'smith', 'jack@email.com','password', 'password')
       click_link('Logout')
       sign_up('mackenzie', 'pickles','mackenzie@email.com', 'password', 'password' )
       end
      Then 'I can send a message to a user by clicking a link on their profile page' do
       visit '/users'
       click_link('Jack Smith')
       click_link('Send message')
       fill_in 'message_subject', with: 'Yo'
       fill_in 'message_body', with: 'Hola'
       click_button('Send')
       expect(page).to have_content('Yo')
       expect(page).to have_content('Hola')
     end
      Then 'I can sign in as Mackenzie and see that message' do
        click_link('Logout')
        sign_in('jack@email.com', 'password')
        click_link('Inbox (1)')
        expect(page).to have_content('Yo')
        expect(page).to have_content('Hola')
      end
      Then 'I mark message as read' do
        click_link('Mark as read')
        expect(page).to have_content('Mark as unread')
      end
      Then 'I put message in trash' do
        click_link('put_in_trash')
        click_link('Trash')
        expect(page).to have_content('Yo')
        expect(page).to have_content('Hola')
      end
      Then 'I restore message' do
        click_link('Restore')
        expect(page).to have_content('Yo')
        expect(page).to have_content('Hola')
      end
      Then 'I can reply' do
        click_link('Yo')
        fill_in 'body', with: 'hey'
        click_button('Send Message')
        expect(page).to have_content('hey')
      end
      Then 'I can see message in sent' do
        click_link('Inbox (0)')
        click_link('Sent')
        expect(page).to have_content('hey')
      end
   end
 end
end
