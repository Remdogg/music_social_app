class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :city, on: :update
  validates_presence_of :state, on: :update
  validates :city, length: {minimum: 2 }, on: :update
  validates :state, length: { minimum: 2 }, on: :update


  belongs_to :bandtogethers_as_member, :class_name => 'Bandtogether', :foreign_key => 'member_id'
  has_many :bandtogethers_as_organizer, :class_name => 'Bandtogether', :foreign_key => 'organizer_id'

  attr_accessor :current_password

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end


end
