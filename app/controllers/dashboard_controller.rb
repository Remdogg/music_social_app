class DashboardController < ApplicationController
  # to include get_unread_count
  include ApplicationHelper
  #counts unread emails in current user inbox
  before_action :get_unread_count

  before_action :get_mailbox

  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.following_ids, owner_type: "User")
    @bandtogethers = current_user.bandtogethers + current_user.bandtogethers_as_organizer
    @bandtogether = Bandtogether.new
    @upcoming_concerts_for_select = Concert.where("start > ?", Time.now).all.map do |concert|
      [concert.title, concert.id]
    end
    @user = current_user
    @users = User.all
      @conversations = @mailbox.inbox
  end


  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

end
