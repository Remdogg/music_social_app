module ApplicationHelper
  #this method counts the number of unread messages for the current user, based on what's in the database
  def get_unread_count
    @messages_count = current_user.mailbox.inbox({:read => false}).count
  end
end
