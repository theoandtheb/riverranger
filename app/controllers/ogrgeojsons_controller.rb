class OgrgeojsonsController < ApplicationController
  before_action :set_ogrgeojson, only: [:show, :edit, :update, :destroy]

  # GET /ogrgeojsons
  # GET /ogrgeojsons.json
  def index
    @ogrgeojsons = Ogrgeojson.all
  end

  # GET /ogrgeojsons/1
  # GET /ogrgeojsons/1.json
  def show
  end

  # GET /ogrgeojsons/new
  def new
    @ogrgeojson = Ogrgeojson.new
  end

  # GET /ogrgeojsons/1/edit
  def edit
  end

  # POST /ogrgeojsons
  # POST /ogrgeojsons.json
  def create
    @ogrgeojson = Ogrgeojson.new(ogrgeojson_params)

    respond_to do |format|
      if @ogrgeojson.save
        format.html { redirect_to @ogrgeojson, notice: 'Ogrgeojson was successfully created.' }
        format.json { render :show, status: :created, location: @ogrgeojson }
      else
        format.html { render :new }
        format.json { render json: @ogrgeojson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ogrgeojsons/1
  # PATCH/PUT /ogrgeojsons/1.json
  def update
    respond_to do |format|
      if @ogrgeojson.update(ogrgeojson_params)
        format.html { redirect_to @ogrgeojson, notice: 'Ogrgeojson was successfully updated.' }
        format.json { render :show, status: :ok, location: @ogrgeojson }
      else
        format.html { render :edit }
        format.json { render json: @ogrgeojson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ogrgeojsons/1
  # DELETE /ogrgeojsons/1.json
  def destroy
    @ogrgeojson.destroy
    respond_to do |format|
      format.html { redirect_to ogrgeojsons_url, notice: 'Ogrgeojson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ogrgeojson
      @ogrgeojson = Ogrgeojson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ogrgeojson_params
      params.require(:ogrgeojson).permit(:name, :wkb_geometry)
    end
end
