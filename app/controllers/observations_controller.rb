class ObservationsController < ApplicationController

  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:index, :show]
  before_filter :modify_coordinates_params, :only => [:create, :update]
  after_filter :update_twitter, :only => [:create], if: "Rails.env.production?"

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all
  end

# GET /observations/1
# GET /observations/1.json
  def show
    @observations = Observation.find_by(id: params[:id])
    @bools = Bool.find_all_by_observation_id(params[:id])
    @tests = Test.find_all_by_observation_id(params[:id])
    
    @photo = Photo.find_by(observation_id: params[:id])
    @comments = Comment.where(observation_id: params[:id])
    
    
    @user = User.find_by(id: @observation.user_id)
    
    #Check to see if objects are valid for the specified observation
    if @photo.nil?
      @photo = Photo.new
    end
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
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @observation.save
        @photo.observation_id = @observation.id
        @observation.region_matches
        if @photo.save
          format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
          format.json { render :show, status: :created, location: @observation }
        else
          format.html { render :new }
          format.json { render json: @observation.errors, status: :unprocessable_entity }
        end
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

  # GET /observations/1/add_data
  def add_data
    @observation_add = Observation.find_by(id: params[:observation_id])
    @bools_attributes = Bool.new
    @tests_attributes = Test.new
    @photo = Photo.new
  end
  
  def create_data
    @observation = Observation.find_by(params.require(:observation).permit(:id))
    @bools = newBool(params)
    @tests = newTest(params)
    
    respond_to do |format|
      if @bools.save && @tests.save
        format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
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
      params['observation']['user_id'] = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:description, :loc_nic, :comment, :coordinates, :user_id, bools_attributes: [:mammal, :reptile, :amphibian, :fish, :plant, :insect, :bird, :species_at_risk, :wildlife_death, :shoreline_alterations, :water_quality, :trash, :foam, :red_blooms, :phragmites, :loosestrife, :dog_strangling_vine, :introduced_honeysuckle, :zebra_mussels, :giant_hogweed, :other_invasive, :id, :_destroy], documents_attributes: [:document_file_name, :document_content_type, :document_file_size, :document_updated_at, :id, :_destroy], photos_attributes: [:image_file_name, :image_content_type, :image_file_size, :image_updated_at, :id, :_destroy], studies_attributes: [:title, :author, :abstract, :url, :id, :_destroy], tests_attributes: [:ph, :temperature, :phosphate, :clarity, :oxygen, :nitri, :nitrate, :ecoli, :id, :_destroy])
    end

    def update_twitter
      puts "Im ouputting some shit here: #{url_for(@observation)}"
      #puts "Im ouputting some shit here: #{@observation.coordinates.y.to_s}"
      if @photo.image.exists?
        photo_url = @photo.image.path(:medium).to_s
        observation_url = url_for(@observation)
        $client.update_with_media("A new observation has just been posted. #{Bitly.client.shorten(observation_url).short_url}", File.open(photo_url))
      else
        $client.update("A new observation has just been posted #{Bitly.client.shorten(observation_url).short_url}.")
      end
    end
  
  def photo_params
    params.require(:observation).permit(:image)
  end
  
  def newBool(params)
    b = Bool.new
    b.mammal = params[:observation][:bool][:mammal]
    b.reptile = params[:observation][:bool][:reptile]
    b.amphibian = params[:observation][:bool][:amphibian]
    b.fish = params[:observation][:bool][:fish]
    b.plant = params[:observation][:bool][:plant]
    b.insect = params[:observation][:bool][:insect]
    b.bird = params[:observation][:bool][:bird]
    b.species_at_risk = params[:observation][:bool][:species_at_risk]
    b.wildlife_death = params[:observation][:bool][:wildlife_death]
    b.shoreline_alterations = params[:observation][:bool][:shoreline_alterations]
    b.water_quality = params[:observation][:bool][:water_quality]
    b.trash = params[:observation][:bool][:trash]
    b.foam = params[:observation][:bool][:foam]
    b.red_blooms = params[:observation][:bool][:red_blooms]
    b.phragmites = params[:observation][:bool][:phragmites]
    b.loosestrife = params[:observation][:bool][:loosestrife]
    b.dog_strangling_vine = params[:observation][:bool][:dog_strangling_vine]
    b.introduced_honeysuckle = params[:observation][:bool][:introduced_honeysuckle]
    b.zebra_mussels = params[:observation][:bool][:zebra_mussels]
    b.giant_hogweed = params[:observation][:bool][:giant_hogweed]
    b.other_invasive = params[:observation][:bool][:other_invasive]
    
    b.observation_id = params[:observation][:id]
    return b
  end

  def newTest(params)
    t = Test.new
    t.ph = params[:observation][:test][:ph]
    t.temperature = params[:observation][:test][:temperature]
    t.phosphate = params[:observation][:test][:phosphate]
    t.clarity = params[:observation][:test][:clarity]
    t.oxygen = params[:observation][:test][:oxygen]
    t.nitri = params[:observation][:test][:nitri]
    t.nitrate = params[:observation][:test][:nitrate]
    t.ecoli = params[:observation][:test][:ecoli]
    
    t.observation_id = params[:observation][:id]
    return t
  end
end



