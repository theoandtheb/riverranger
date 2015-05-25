module ObservationsHelper
  def boolsCountNumberOf (o_id, param)
    @oBools = Bool.where(observation_id: o_id)
    i = 0
    @oBools.each do |b|
      if b[param]
       i += 1
     end
    end
    return i
  end
end
