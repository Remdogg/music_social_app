class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bandtogether = Bandtogether.new

    @bandtogethers = Bandtogether.where(organizer_id: @user.id)

    @concerts_for_select = Concert.all.map do |concert|
      [concert.title, concert.id]
    end
  end

  def index
    @users = User.all
  end

end
