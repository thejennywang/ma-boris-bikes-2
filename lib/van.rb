require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY, bikes: [])
		# self.capacity = options.fetch(:capacity, capacity)
		@capacity = capacity
		@bikes    = bikes
	end

	def pick_up_broken_bikes(station)
		station.broken_bikes.each do |bike| 
			self.dock(bike) 
			station.release(bike)
		end
	end

	def release_broken_bikes(garage)
		self.broken_bikes.each do |bike| 
			self.release(bike)
			garage.dock(bike)
		end
	end

	def pick_up_working_bikes(garage)
		garage.available_bikes.each do |bike|
			self.dock(bike)
			garage.release(bike)
		end
	end

	def release_working_bikes(station)
		self.available_bikes.each do |bike|
			self.release(bike)
			station.dock(bike)
		end
	end

end