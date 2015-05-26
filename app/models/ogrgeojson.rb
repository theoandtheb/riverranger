class Ogrgeojson < ActiveRecord::Base
	has_and_belongs_to_many :observations
	# serialize :wkb_geometry, JSON

	def geojson
		a = RGeo::GeoJSON.encode(self.wkb_geometry).to_json
	end
end
