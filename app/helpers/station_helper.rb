module StationHelper

	def nearby(long1, lat1, long2, lat2)
		if (long1 - long2).abs <= 0.01 && (lat1 - lat2).abs <= 0.01
			return true
		else
			return false
		end
	end
	
end
