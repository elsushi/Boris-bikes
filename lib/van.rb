class Van

	def initialize(capacity=20)
		@bikes = []
		@capacity = capacity
	end

	def collect_bikes_from storage_unit
		@bikes << storage_unit.release
	end

	def add_bike(bike)
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end

	def drops_bikes_at storage_unit
		storage_unit.accept
	end

	def full?
		bike_count == @capacity
	end

end