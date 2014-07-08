require_relative 'bike_container'


module GarageExtensions
	def dock (bike)
		super
		bike.fix!
	end
end

class Garage

	prepend GarageExtensions	
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	
end
