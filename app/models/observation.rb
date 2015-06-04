class Observation < ActiveRecord::Base
	belongs_to :user
	has_many :bools, :dependent => :destroy
	has_many :documents, :dependent => :destroy
	has_many :photos, :dependent => :destroy
	has_many :studies, :dependent => :destroy
	has_many :tests, :dependent => :destroy
  has_and_belongs_to_many :ogrgeojsons

	accepts_nested_attributes_for :bools, reject_if: :all_blank
	accepts_nested_attributes_for :documents, reject_if: :all_blank
	accepts_nested_attributes_for :photos, reject_if: :all_blank
	accepts_nested_attributes_for :studies, reject_if: :all_blank
	accepts_nested_attributes_for :tests, reject_if: :all_blank

  def coordinates_x
    self.coordinates.x
  end

  def within(distance)
    Observation.find_by_sql("SELECT * FROM observations WHERE ST_DWithin(coordinates::geography, '#{self.coordinates}', #{distance})")
  end

  def coordinates_y
    self.coordinates.y
  end

  def region_matches
  	@matches = Array.new
  	@regions = Ogrgeojson.all
  	@regions.each do |r|
  		if r.wkb_geometry.contains?(self.coordinates)
  			@matches << r.id
  		end
  	end
    if @matches.count > 0
      @matches.each do |t|
        self.ogrgeojsons << Ogrgeojson.find(t)
      end
    end
  end

    def region_notice
        @region_ids = self.ogrgeojson_ids.flatten.map(&:to_s)
      @user_ids = Array.new
      unless @region_ids.count == 0
        @region_ids.each do |r|
          @user_ids << Ogrgeojson.find(r).user_ids
        end
        @user_ids = @user_ids.flatten.uniq.map(&:to_s)
      end
      unless @user_ids.count == 0
        @user_ids.each do |u|         
          @user = User.find(u)
          ObservationMailer.delay.build_mail(@user,self)
        end       
      end
    end

end
