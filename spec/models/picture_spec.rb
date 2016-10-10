require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'is a thing' do
    expect{Picture.new}.to_not raise_error
  end
end
