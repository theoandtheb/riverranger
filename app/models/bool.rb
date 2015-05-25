class Bool < ActiveRecord::Base
	belongs_to :observation
  
  def find_all_by_observation_id(o_id)
    allBools = Bool.where(observation_id: o_id) 
  end
end
