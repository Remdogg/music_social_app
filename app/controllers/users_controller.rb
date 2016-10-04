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

  def join
    @user = current_user
    # @bandtogether set to bandtogether on current page
    @bandtogether = Bandtogether.find(params[:id])
    # @membership set to membership matching the bandtogether on current page and mapping all members
    @membership = Membership.where(bandtogether_id: @bandtogether.id).map {|membership| membership.bandtogether_id}
    # if the current user's id is NOT in the membership array, add it and redirect to bandtogether page.
    if !@membership.include?(@user.id)
      @user.bandtogethers << @bandtogether
      redirect_to "/bandtogethers/" + @bandtogether.id.to_s
    # if the current user's id IS in the membership array,  redirect to bandtogether page.
    else
      redirect_to "/bandtogethers/" + @bandtogether.id.to_s
    end
  end

  def leave
    @user = current_user
    # @bandtogether set to bandtogether on current page
    @bandtogether = Bandtogether.find(params[:id])
    # @membership set to membership matching the bandtogether on current page and mapping all members
    @membership = Membership.where(bandtogether_id: @bandtogether.id).map {|membership| membership.bandtogether_id}
    # if the current user's id is NOT in the membership array, add it and redirect to bandtogether page.
    if @membership.include?(@user.id)
      @user.bandtogethers.delete(@bandtogether)
      redirect_to "/bandtogethers/" + @bandtogether.id.to_s
    # if the current user's id IS in the membership array,  redirect to bandtogether page.
    else
      redirect_to "/bandtogethers/" + @bandtogether.id.to_s
    end
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
