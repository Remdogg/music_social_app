class Concert < ActiveRecord::Base
<<<<<<< HEAD
  has_many :bandtogethers
=======
  has_many :bandtogethers, dependent: :destroy
>>>>>>> 8da1da95ab4edef4a5cb2282fc2674fe0f82e1fb
  resourcify
  validates_presence_of :city

  def full_address
    @address = address
    @city = city
    @state = state
    @full_address = @address + " " + @city + " " + @state
  end
<<<<<<< HEAD
  
=======

>>>>>>> 8da1da95ab4edef4a5cb2282fc2674fe0f82e1fb
  geocoded_by :full_address
  after_validation :geocode
end
