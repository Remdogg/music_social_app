class Bandtogether < ActiveRecord::Base
  belongs_to :concert
  belongs_to :organizer, :class_name => 'User'
  has_many :members, through: :memberships, source: :user
  has_many :memberships

  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 2, maximum: 500 }

  validates_presence_of :title
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :description
  validates_presence_of :concert


end
