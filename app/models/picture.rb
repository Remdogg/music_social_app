class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture, :styles => { :medium => "90x90>", :thumb => "50x50#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
