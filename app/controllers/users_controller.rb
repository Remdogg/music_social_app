class UsersController < ApplicationController

  before_action :current_user, only: [:index, :edit, :update, :destroy, :following, :followers]

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = User.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = User.all
    render 'show_follow'
  end

  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
end
