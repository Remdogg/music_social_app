class Membership < ActiveRecord::Base
  belongs_to :bandtogether
  belongs_to :user

end
