class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :show]
  before_filter :modify_coordinates_params, :only => [:create, :update]

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all
  end

# GET /observations/1
 # GET /observations/1.json
  def show
    @observations = Observation.all
    @bools = Bool.find_by(observation_id: params[:id])
    @tests = Test.find_by(observation_id: params[:id])
  end

 
  # GET /observations/new
  def new
      @observation = Observation.new
      @observation.bools.new
      @observation.documents.new
      @observation.photos.new
      @observation.studies.new
      @observation.tests.new
  end

  # GET /observations/1/edit
  def edit
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(observation_params)
    respond_to do |format|
      if @observation.save
        format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observations_url, notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation
      @observation = Observation.find(params[:id])
    end

    def modify_coordinates_params
      #params['observation']['coordinates'] = RGeo::Geographic.spherical_factory(srid: 4326).point(params['observation']['coordinates'].to_s)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:description, :comment, :coordinates, :user_id, bools_attributes: [:mammal, :reptile, :amphibian, :fish, :plant, :insect, :bird, :species_at_risk, :wildlife_death, :shoreline_alterations, :water_quality, :trash, :foam, :red_blooms, :phragmites, :loosestrife, :dog_strangling_vine, :introduced_honeysuckle, :zebra_mussels, :giant_hogweed, :other_invasive, :id, :_destroy], documents_attributes: [:document_file_name, :document_content_type, :document_file_size, :document_updated_at, :id, :_destroy], photos_attributes: [:image_file_name, :image_content_type, :image_file_size, :image_updated_at, :id, :_destroy], studies_attributes: [:title, :author, :abstract, :url, :id, :_destroy], tests_attributes: [:ph, :temperature, :phosphate, :clarity, :oxygen, :nitri, :nitrate, :ecoli, :id, :_destroy])
    end
end



