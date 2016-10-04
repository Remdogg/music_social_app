class DashboardController < ApplicationController

  def index
    @bandtogethers = current_user.bandtogethers + current_user.bandtogethers_as_organizer
    
    @user = current_user
    @users = User.all
  end

end
