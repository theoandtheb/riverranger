class Test < ActiveRecord::Base
	belongs_to :observation

  def self.find_all_by_observation_id(o_id)
    allTests = Test.where(observation_id: o_id)
    parsedTests = {}
    
    allTests.each do |t|
      t.attributes.each do |attr_name, attr_val|
        unless attr_val.nil?
          if parsedTests[attr_name]
            parsedTests[attr_name][:values] << attr_val
            parsedTests[attr_name][:date] = t.created_at
          else
            parsedTests[attr_name] = {values: [attr_val], date: t.created_at}
          end
        end
      end
    end
    return parsedTests
  end
end
