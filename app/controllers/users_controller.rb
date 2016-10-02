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
    if user_signed_in?
      @user = User.find(params[:id])
      @bandtogether = Bandtogether.new

      @bandtogethers = Bandtogether.where(organizer_id: @user.id)

      @concerts_for_select = Concert.all.map do |concert|
        [concert.title, concert.id]
      end
    else
      redirect_to '/'
    end
  end

  def index
    if user_signed_in?
      @users = User.all
    else
      redirect_to '/'
    end
  end

end
