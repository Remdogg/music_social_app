class BandtogethersController < ApplicationController
  before_action :set_bandtogether, only: [:show, :edit, :update, :destroy]

  # GET /bandtogethers
  # GET /bandtogethers.json
  def index
    @bandtogethers = Bandtogether.all
  end

  # GET /bandtogethers/1
  # GET /bandtogethers/1.json
  def show
  end

  # GET /bandtogethers/new
  def new
    @bandtogether = Bandtogether.new
  end

  # GET /bandtogethers/1/edit
  def edit
  end

  # POST /bandtogethers
  # POST /bandtogethers.json
  def create
    @bandtogether = Bandtogether.new(bandtogether_params)
    @bandtogether.organizer_id = current_user.id


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
    @bandtogether.destroy
    respond_to do |format|
      format.html { redirect_to bandtogethers_url, notice: 'Bandtogether was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bandtogether
      @bandtogether = Bandtogether.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bandtogether_params
      params.require(:bandtogether).permit(:title, :start_time, :end_time, :description, :concert_id)
    end
end
