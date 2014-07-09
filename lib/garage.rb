require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	
	def fix_bikes
		self.broken_bikes.each { |bike| bike.fix! }
	end
end
