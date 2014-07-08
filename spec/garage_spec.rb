require 'garage'

describe Garage do
	
	it 'is empty when created' do
		garage = Garage.new
		expect(garage.bike_count).to eq 0
	end

	it 'can be initialized with a capacity of 500' do
		garage = Garage.new(capacity: 500)
		expect(garage.capacity).to eq 500
	end

	it 'should fix bikes when docked' do
		bike = double :bike
		garage = Garage.new
		
		expect(bike).to receive(:fix!)
		garage.dock(bike)
	end

end