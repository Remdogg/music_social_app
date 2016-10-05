class Concert < ActiveRecord::Base
  has_many :bandtogethers

  geocoded_by :address
  after_validation :geocode
end
