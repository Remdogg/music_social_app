class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :first_name, on: :update
  validates_presence_of :last_name, on: :update
  validates_presence_of :city, on: :update
  validates_presence_of :state, on: :update  


  belongs_to :bandtogethers_as_member, :class_name => 'Bandtogether', :foreign_key => 'member_id'
  has_many :bandtogethers_as_organizer, :class_name => 'Bandtogether', :foreign_key => 'organizer_id'


end
