require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let (:bike) { double :bike}
	let (:bike2) { double :bike2}
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
		BikeContainer::DEFAULT_CAPACITY.times {holder.dock(bike)}
		expect(holder.full?).to be true
	end

	it 'should not accept bikes beyond capacity' do
		BikeContainer::DEFAULT_CAPACITY.times {holder.dock(bike)}
		expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of available bikes' do
		working_bike = double :working_bike, broken?: false
		broken_bike = double :broken_bike,  broken?: true  
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

end