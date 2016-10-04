require 'rails_helper'

RSpec.describe Bandtogether, type: :model do
  it "is a thing" do
    expect{Bandtogether.new}.to_not raise_error
  end

  it "is valid with a title, start time, end time, description, and concert" do
    expect(Bandtogether.new(title: 'twizzle', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())).to be_valid
  end

  it "is invalid without a title" do
    expect(Bandtogether.new(start_time: '8', end_time: '10', description: 'carpool')).to_not be_valid
  end

  it "is invalid without a start time" do
    expect(Bandtogether.new(title: 'TSwift', end_time: '10', description: 'carpool')).to_not be_valid
  end

  it "is invalid without an end time" do
    expect(Bandtogether.new(title: 'TSwift', start_time: '8', description: 'carpool')).to_not be_valid
  end

  it "is invalid without a description" do
    expect(Bandtogether.new(title: 'TSwift', start_time: '8', end_time: '10')).to_not be_valid
  end


  it 'can belong to one organizer' do
    user = User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')
    bandtogether1 = Bandtogether.new(title: 'twizzle', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())

    user.id = 1
    user.save

    user.bandtogethers_as_organizer << bandtogether1

    expect(bandtogether1.organizer).to match user

  end

  it 'can have many members' do

    user1 = User.new(first_name: 'Taylor', last_name: 'Swift', email: 'joe@joe.com', password: 'password', password_confirmation: 'password')

    user1.id = 1
    user1.save

    user2 = User.new(first_name: 'Joe', last_name: 'Swift', email: 'jose@jose.com', password: 'password', password_confirmation: 'password')

    user2.id = 2
    user2.save

    bandtogether1 = Bandtogether.new(title: 'twizzle', start_time: '8pm', end_time: '8:01pm', description: 'carpool from one block to the other', concert: Concert.new())

    bandtogether1.id = 3
    bandtogether1.save

    bandtogether1.members << user1

    bandtogether1.members << user2

    expect(bandtogether1.members.map {|user| user.id}).to match [user1.id, user2.id]

    expect(Membership.where(bandtogether_id: "3").map {|membership| membership.user_id}).to match [user1.id, user2.id]


  end


end
