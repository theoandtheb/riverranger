class Ogrgeojson < ActiveRecord::Base
	has_and_belongs_to_many :observations
	has_and_belongs_to_many :users
	# serialize :wkb_geometry, JSON

	def geojson
		a = RGeo::GeoJSON.encode(self.wkb_geometry).to_json
	end

	def self.bounding_box
	if ENV['BOUNDS'] == nil	
		@z = self.all
		a = -180
		b = 0
		c = 0
		d = 180
		@z.each do |t|
			k = RGeo::Cartesian::BoundingBox.create_from_geometry(t.wkb_geometry, opts_ = {})
			if k.max_x > a
				a = k.max_x
			end
			if k.min_x < b
				b = k.min_x
			end
			if k.max_y > c
				c = k.max_y
			end
			if k.min_y < d
				d = k.min_y
			end
		end
		ENV['BOUNDS'] = [[d,b],[c,a]].to_s
	else
		ENV['BOUNDS']
	end
	end
end
