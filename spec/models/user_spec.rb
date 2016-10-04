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

  it 'can be the organizer for many bandtogethers' do
    user = User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')
    bandtogether1 = Bandtogether.new(title: 'twizzle', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())
    bandtogether2 = Bandtogether.new(title: 'twizzle2', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())

    user.bandtogethers_as_organizer << bandtogether1
    user.bandtogethers_as_organizer << bandtogether2

    expect(user.bandtogethers_as_organizer.map {|bandtogether| bandtogether.title}).to match ['twizzle', 'twizzle2']

  end

  it 'can be a member of many bandtogethers' do
    user = User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')
    bandtogether1 = Bandtogether.new(title: 'twizzle', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())
    bandtogether2 = Bandtogether.new(title: 'twizzle2', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())

    user2 = User.new(first_name: 'Joe', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')
    user2.id = 1
    user2.bandtogethers << bandtogether1
    user2.bandtogethers << bandtogether2
    user2.save
    expect(user2.bandtogethers.map {|bandtogether| bandtogether.title}).to match ['twizzle', 'twizzle2']

    expect(Membership.where(user_id: "1").map {|membership| membership.bandtogether_id}).to match [bandtogether1.id, bandtogether2.id]

  end

end
