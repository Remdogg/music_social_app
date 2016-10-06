require 'rails_helper'
require 'support/features_support'

RSpec.feature "Messagings", type: :feature do
  context 'Sending Message' do
   Steps 'Send a message' do
     Given 'I am signed in' do
       sign_up('jack@email.com', 'password', 'jack', 'smith')
       save_and_open_page
     end
   end
 end
end
