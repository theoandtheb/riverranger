class ObservationMailer < ApplicationMailer
	# def self.region_notice
 #    	@region_ids = self.ogrgeojson_ids.flatten.map(&:to_s)
 #    	@user_ids = Array.new
 #    	unless @region_ids.count == 0
 #    		@region_ids.each do |r|
 #    			@user_ids << Ogrgeojson.find(r).user_ids
 #    		end
 #    		@user_ids = @user_ids.flatten.uniq.map(&:to_s)
 #    	end
 #    	unless @user_ids.count == 0
 #    		@user_ids.each do |u|   			
 #    			@user = User.find(u)
 #    			ObservationMailer.delay.build_mail(@user,obs)
 #    		end				
 #    	end
 #    end

  #   @users = []
  #   @regids.each do |g|
		# @users = User.includes(:ogrgeojsons).where(ogrgeojsons: { id: g })

  #   		if @users.count > 0    			
    			
  #   			@users.each do |k|
  #   				@list = []
  #   				@user = k
  #   				@observation = obs
  #   				unless @list.include? k.id
    					
  #   					@list << k.id
  #   				end
  #   			end
		# 	end
		# end
  # 	end

  	def build_mail(user,observation)
  		 @user = user
  		 @observation = observation
  		@url  = observation_url(observation.id)
  		mail(to: user.email, subject: 'A New Observation Has Been Reported In A Region You Are Following')
  	end
end
