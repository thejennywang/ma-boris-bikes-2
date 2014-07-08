require './lib/bike_container'
require 'bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let (:bike) { Bike.new }
	let (:bike2) { Bike.new }
	let (:holder) { ContainerHolder.new }

	it 'should accept a bike' do
		expect(holder.bike_count).to eq (0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it 'should be able to release a bike' do
		holder.dock(bike)
		holder.dock(bike2)
		holder.release(bike)
		expect(holder.bikes).to eq [bike2]
	end

	it 'should know its capacity' do
		BikeContainer::DEFAULT_CAPACITY.times {holder.dock(Bike.new)}
		expect(holder.full?).to be true
	end

	it 'should not accept bikes beyond capacity' do
		BikeContainer::DEFAULT_CAPACITY.times {holder.dock(Bike.new)}
		expect(lambda {holder.dock(Bike.new)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

end