require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is a thing' do
    expect{User.new}.to_not raise_error
  end
  it "is valid with first name, last name, email, pw, and conf pw" do
    expect(User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')).to be_valid
  end

  it "is invalid without a firstname" do
    expect(User.new(last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')).to_not be_valid
  end

  it "is invalid without a last name" do
    expect(User.new(first_name: 'Taylor', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')).to_not be_valid
  end

  it "is invalid without an email" do
    expect(User.new(first_name: 'Taylor', last_name: 'Swift', password: 'password', password_confirmation: 'password')).to_not be_valid
  end

  it "is invalid without a password" do
    expect(User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password_confirmation: 'password')).to_not be_valid
  end

  it "is invalid if password confirmation does not match password" do
    expect(User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: '')).to_not be_valid
  end

  
end
