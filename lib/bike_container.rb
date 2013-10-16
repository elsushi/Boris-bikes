module BikeContainer

def bike_count
		@bikes.count
	end

def dock bike
		raise "Station is full" if full?
		@bikes << bike
	end

def full?
		bike_count == @capacity
	end

	def release
		@bikes.delete(available_bikes.first)
	end

end