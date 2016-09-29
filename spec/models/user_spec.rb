require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is a thing' do
    expect{User.new}.to_not raise_error
  end
  it "is valid with email, pw, and conf pw" do
    expect(User.new(email: 'joe@joe.com', password: 'password', password_confirmation: 'password')).to be_valid
  end

  it "is invalid without a firstname" do
    # user = User.new(email: 'joe@joe.com', password: 'password', password_confirmation: 'password')
    # expect(user.update()).to be_invalid
  end

  it "returns a contact's full name as a string"
end
