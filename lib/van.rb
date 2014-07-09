require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY, bikes: [])
		# self.capacity = options.fetch(:capacity, capacity)
		@capacity = capacity
		@bikes    = bikes
	end

	# def pick_up(bike_type, location)
	# 		location.select_bikes(bike_type).each do |bike| 
	# 		self.dock(bike) 
	# 		location.release(bike)
	# 	end
	# end

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
		garage.working_bikes.each do |bike|
			self.dock(bike)
			garage.release(bike)
		end
	end

	def release_working_bikes(station)
		self.working_bikes.each do |bike|
			self.release(bike)
			station.dock(bike)
		end
	end

end