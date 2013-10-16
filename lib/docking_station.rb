require_relative 'bike_container'

class DockingStation

	include BikeContainer

	DEFAULT_CAPACITY = 10
	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	
	def release
		@bikes.delete(available_bikes.first)
	end
	
	
	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end
	def unavailable_bikes
		@bikes.select {|bike| bike.broken?}
	end
	def release_broken_bikes
		@bikes.delete(unavailable_bikes.first)
	end

end