class Station

	DEFAULT_CAPACITY = 20
	
	def initialize (capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def bikes
		@bikes
	end

	def capacity
		@capacity
	end

	def dock (bike)
		raise "Sation is full" if full?
		@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bikes.count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

end