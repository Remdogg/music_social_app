require 'rails_helper'

RSpec.describe Concert, type: :model do
  it "is a thing" do
    expect{Concert.new}.to_not raise_error
  end
end
