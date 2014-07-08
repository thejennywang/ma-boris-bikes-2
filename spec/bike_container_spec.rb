require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let (:bike) { double :bike, instance_of?: true }
	let (:bike2) { double :bike2, instance_of?: true }
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
		working_bike = double :working_bike, broken?: false, instance_of?: true
		broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it 'should know if it has no bikes' do
		expect(holder.empty?).to be true
	end

	it 'should not release a bike if it is empty' do
		expect(lambda {holder.release(bike)}).to raise_error(RuntimeError)
	end

	it 'should only accept bikes, not bananas' do
		expect(lambda {holder.dock("banana")}).to raise_error(RuntimeError)
	end

	it 'should only release bikes, not bananas' do
		expect(lambda {holder.release("banana")}).to raise_error(RuntimeError)
	end

end