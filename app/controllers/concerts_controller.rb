class ConcertsController < ApplicationController
  # to include get_unread_count
  include ApplicationHelper


  before_action :authenticate_user!, :set_concert, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource

  #counts unread emails in current user inbox
  before_action :get_unread_count
  # GET /concerts
  # GET /concerts.json

  def index
     if params[:search].nil? || params[:search].empty?
       @concerts = Concert.all
       @upcoming_concerts = Concert.where("start > ?", Time.now)
     else
       @upcoming_concerts = Concert.fuzzy_search(params[:search])
     end
     #google maps
     @pindrop = Gmaps4rails.build_markers(@upcoming_concerts) do |concert, marker|
       marker.lat concert.latitude
       marker.lng concert.longitude
       marker.infowindow concert.address
     end
   end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
    @user = current_user
    @bandtogether = Bandtogether.new
    @bandtogether.concert = Concert.find(params[:id])
    @concerts = Concert.find(params[:id]) #@concerts may also be found using the set_concert method provided by scaffolding
    @pindrop = Gmaps4rails.build_markers(@concerts) do |concert, marker|
      marker.lat concert.latitude
      marker.lng concert.longitude
      marker.infowindow concert.address
    end
  end

  # GET /concerts/new
  def new
    if current_user.has_role? :admin
      @concert = Concert.new
    else
      redirect_to '/concerts'
    end
  end

  # GET /concerts/1/edit
  def edit
    if !current_user.has_role? :admin
      redirect_to '/concerts'
    end
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        @concert.create_activity :create, owner: current_user
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    if current_user.has_role? :admin
      respond_to do |format|
        if @concert.update(concert_params)
          @concert.create_activity :update, owner: current_user
          format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
          format.json { render :show, status: :ok, location: @concert }
        else
          format.html { render :edit }
          format.json { render json: @concert.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    if current_user.has_role? :admin
      @concert.destroy
      respond_to do |format|
        format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def map_location
     @concert = concert.find(params[:concert_id])
     @hash = Gmaps4rails.build_markers(@concert) do |concert, marker|
       marker.lat concert.latitude
       marker.lng concert.longitude
       marker.infowindow concert.address
     end
     render json: @hash.to_json
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.require(:concert).permit(:title, :start, :end, :artist, :city, :state, :address, :latitude, :longitude)
    end
end
