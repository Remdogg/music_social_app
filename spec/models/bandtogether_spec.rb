require 'rails_helper'

RSpec.describe Bandtogether, type: :model do
  it "is a thing" do
    expect{Bandtogether.new}.to_not raise_error
  end
end
