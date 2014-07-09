require 'garage'
require 'bike_container_spec'

describe Garage do

	it_behaves_like 'a bike container'

	it 'is empty when created' do
		garage = Garage.new
		expect(garage.bike_count).to eq 0
		# expect(garage.bike_count).not_to have_bikes
	end

	it 'can be initialized with a capacity of 500' do
		garage = Garage.new(capacity: 500)
		expect(garage.capacity).to eq 500
	end

	it 'should fix broken bikes docked in garage' do
		bike = double :bike, instance_of?: :Bike, broken?: true, fix!: :bike
		garage = Garage.new
		garage.dock(bike)
		expect(bike).to receive(:fix!)
		garage.fix_bikes
	end
end