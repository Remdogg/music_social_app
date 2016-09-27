require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  #first test for sign up page
  it 'is a website' do
    expect{User.new}.to_not raise_error
  end
end
