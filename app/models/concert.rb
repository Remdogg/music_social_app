class Concert < ActiveRecord::Base
  has_many :bandtogethers

  validates_presence_of :city

  def full_address
    @address = address
    @city = city
    @state = state
    @full_address = @address + " " + @city + " " + @state
  end
  geocoded_by :full_address
  after_validation :geocode
end
