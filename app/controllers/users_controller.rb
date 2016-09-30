class UsersController < ApplicationController


  before_action :current_user, only: [:index, :edit, :update, :destroy, :following, :followers]

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = User.all
    render 'show_following'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = User.all
    render 'show_follow'
  end


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
