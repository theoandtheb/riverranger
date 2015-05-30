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
end
