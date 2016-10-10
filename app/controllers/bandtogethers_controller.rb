class BandtogethersController < ApplicationController
  # to include get_unread_count
  include ApplicationHelper
  before_action :set_bandtogether, only: [:show, :edit, :update, :destroy]
  #counts unread emails in current user inbox
  before_action :get_unread_count

  # GET /bandtogethers
  # GET /bandtogethers.json
  def index
    @bandtogethers = Bandtogether.all

  end

  # GET /bandtogethers/1
  # GET /bandtogethers/1.json
  def show

    if user_signed_in?
      @user = current_user
      # @bandtogether set to bandtogether on current page
      @bandtogether = Bandtogether.find(params[:id])
      @concert = @bandtogether.concert
      # @membership set to membership matching the bandtogether on current page and mapping all members
      @membership = Membership.where(bandtogether_id: @bandtogether.id).map {|membership| membership.user_id}
    else
       redirect_to '/users/sign_up'
    end
  end

  # GET /bandtogethers/new
  def new
    if user_signed_in?
      @bandtogether = Bandtogether.new
      @concerts_for_select = Concert.all.map do |concert|
      [concert.title, concert.id]
      end
      @bandtogether.concert = Concert.first
    else
      redirect_to '/'
    end
  end
  # GET /bandtogethers/1/edit
  def edit
      @bandtogether = Bandtogether.find(params[:id])
    if @bandtogether.organizer_id == current_user.id
      @concerts_for_select = Concert.all.map do |concert|
        [concert.title, concert.id]
      end
      @bandtogether.concert = Concert.first
    else
      redirect_to '/bandtogethers'
    end
  end

  # POST /bandtogethers
  # POST /bandtogethers.json
  def create
    @bandtogether = Bandtogether.new(bandtogether_params)
    @bandtogether.organizer_id = current_user.id
    @concerts_for_select = Concert.all.map do |concert|
      [concert.title, concert.id]
    end

    respond_to do |format|
      if @bandtogether.save
        format.html { redirect_to @bandtogether, notice: 'Bandtogether was successfully created.' }
        format.json { render :show, status: :created, location: @bandtogether }
      else
        format.html { render :new }
        format.json { render json: @bandtogether.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bandtogethers/1
  # PATCH/PUT /bandtogethers/1.json
  def update
    respond_to do |format|
      if @bandtogether.update(bandtogether_params)
        format.html { redirect_to @bandtogether, notice: 'Bandtogether was successfully updated.' }
        format.json { render :show, status: :ok, location: @bandtogether }
      else
        format.html { render :edit }
        format.json { render json: @bandtogether.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bandtogethers/1
  # DELETE /bandtogethers/1.json
  def destroy
    if @bandtogether.organizer_id == current_user.id
      @bandtogether.destroy
      respond_to do |format|
        format.html { redirect_to bandtogethers_url, notice: 'Bandtogether was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/bandtogethers'
    end

  end

  def invite
    @bandtogether = Bandtogether.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bandtogether
      @bandtogether = Bandtogether.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bandtogether_params
      params.require(:bandtogether).permit(:title, :start_time, :end_time, :description, :concert_id, :bandtogether_avatar)
    end
end
