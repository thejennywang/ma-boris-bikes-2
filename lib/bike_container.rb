require_relative 'bike'
module BikeContainer

DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Oops! That's not a bike!" unless bike.instance_of?(Bike)
		raise "Sorry! There is no more room for bikes." if full?
		@bikes << bike
	end

	def release(bike)
		raise "Oops! We only release bikes :P" unless bike.instance_of?(Bike)
		raise "Sorry! There aren't any bikes." if empty?
		@bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select { |bike| bike.broken?}
	end
end