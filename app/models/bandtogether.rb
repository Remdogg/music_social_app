class Bandtogether < ActiveRecord::Base
  belongs_to :concert
  belongs_to :organizer, :class_name => 'User'
  belongs_to :member, :class_name => 'User'
end
