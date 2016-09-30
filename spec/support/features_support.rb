
def sign_up(email, password, first_name, last_name)
  visit '/users/sign_up'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  click_button 'Sign up'
end