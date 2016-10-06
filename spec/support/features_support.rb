
def sign_up(email, password, confirmation, first_name, last_name)
  visit '/users/sign_up'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  click_button 'Sign up'
end

def sign_in(email, password)
  click_link 'Login'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  click_button 'Log in'
end

def new_concert(title, artist, address, city, state)
  visit '/concerts/new'
  fill_in 'concert[title]', with: title
  fill_in 'concert[artist]', with: artist
  fill_in 'concert[address]', with: address
  fill_in 'concert[city]', with: city
  fill_in 'concert[state]', with: state
  click_button 'Submit'
end
