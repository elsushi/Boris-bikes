require_relative 'bike_container'

class Garage

	include BikeContainer


def initialize
		@capacity = 10
	  @bikes = []
		@broken = true
end

# def bike_count
# 	@bikes.count
# end

# def dock bike
# 	@bikes << bike
# end

def bike_broken? 
	@broken
end

def fix broken_bike
	@broken = false
end

def release bike
	@bikes.delete(bike)
end

end