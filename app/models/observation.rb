class Observation < ActiveRecord::Base
	belongs_to :user
	has_many :bools
	has_many :documents
	has_many :photos
	has_many :studies
	has_many :tests
  has_and_belongs_to_many :ogrgeojsons

	accepts_nested_attributes_for :bools, reject_if: :all_blank
	accepts_nested_attributes_for :documents, reject_if: :all_blank
	accepts_nested_attributes_for :photos, reject_if: :all_blank
	accepts_nested_attributes_for :studies, reject_if: :all_blank
	accepts_nested_attributes_for :tests, reject_if: :all_blank

  def coordinates_x
    self.coordinates.x
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
      puts self.ogrgeojsons.count
    end
  end
end
