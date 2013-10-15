class Van

	def initialize
		@bikes = []
	end

	def collect_bikes_from station
		station.release
	end

	def add_bike(bike)
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end

	def drops_bikes_at garage
		garage.accept
	end

end