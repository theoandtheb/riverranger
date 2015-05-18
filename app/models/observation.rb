class Observation < ActiveRecord::Base
	belongs_to :user

  def coordinates_x
    self.coordinates.x
  end

  def coordinates_y
    self.coordinates.y
  end
end
