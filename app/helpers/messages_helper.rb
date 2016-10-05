module MessagesHelper

  def recipients_options
   s = ''
   User.all.each do |user|
     s << "<option value='#{user.id}' data-img-src='#{image_tag(user.avatar.url(user.email, size: 50))}'>#{user.first_name} #{user.last_name}</option>"
   end
   s.html_safe
 end




end
