class DashboardController < ApplicationController

  def index
    @bandtogethers = current_user.bandtogethers + current_user.bandtogethers_as_organizer
    @bandtogether = Bandtogether.new
    @concerts_for_select = Concert.all.map do |concert|
      [concert.title, concert.id]
    end
    @user = current_user
    @users = User.all
  end

end
