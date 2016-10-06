require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'is a thing' do
    expect{Role.new}.to_not raise_error
  end

end
