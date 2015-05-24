class Ogrgeojson < ActiveRecord::Base
	# serialize :wkb_geometry, JSON

	def geojson
		puts RGeo::GeoJSON.encode(self.wkb_geometry).to_json
	end
end
