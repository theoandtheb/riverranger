class Bool < ActiveRecord::Base
	belongs_to :observation
  
  def self.find_all_by_observation_id(o_id)
    allBools = Bool.where(observation_id: o_id)
    parsedBools = {}
    
    allBools.each do |b|
      b.attributes.each do |attr_name, attr_val|
        if attr_val          
          if parsedBools[attr_name]
            parsedBools[attr_name][:total] += 1
            parsedBools[attr_name][:date] = b.created_at
          else
            parsedBools[attr_name] = {total: 1, date: b.created_at}
          end
        end
      end
    end
    return parsedBools
  end

end
