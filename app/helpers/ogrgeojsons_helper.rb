module OgrgeojsonsHelper
	def regtype_text(regtype)
		case regtype
		when 1
			"Watershed"
		when 2
			"Conservation Authority"
		else
			"Other"
		end
	end
end
