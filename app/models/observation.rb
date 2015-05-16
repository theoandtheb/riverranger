class Observation < ActiveRecord::Base
  def coordinates_x
    self.coordinates.x
  end

  def coordinates_y
    self.coordinates.y
  end
end
