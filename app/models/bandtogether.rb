class Bandtogether < ActiveRecord::Base
  #newsfeed gem
  include PublicActivity::Common
  # tracked owner: ->(controller, model) {controller && controller.current_user}



  resourcify

  belongs_to :concert
  belongs_to :organizer, :class_name => 'User'
  has_many :members, through: :memberships, source: :user
  has_many :memberships, dependent: :destroy

  #commontator gem
  acts_as_commontable
  acts_as_commontator


  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 2, maximum: 500 }

  validates_presence_of :title
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :description
  validates_presence_of :concert

  has_attached_file :bandtogether_avatar, :styles => { :medium => "300x300>", :thumb => "50x50#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :bandtogether_avatar, :content_type => /\Aimage\/.*\Z/


end
