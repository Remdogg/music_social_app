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


end
