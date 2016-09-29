class Bandtogether < ActiveRecord::Base
  belongs_to :concert
  belongs_to :organizer, :class_name => 'User'
  has_many :members, :class_name => 'User'
end
