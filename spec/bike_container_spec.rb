require './lib/bike_container'

# class ContainerHolder; include BikeContainer; end

shared_examples 'a bike container' do
	let (:container) {described_class.new(capacity:20)}
# end

# describe BikeContainer do
	
	let (:bike) { double :bike, instance_of?: true, fix!: :bike }
	let (:bike2) { double :bike2, instance_of?: true, fix!: :bike }
	# let (:container) { ContainerHolder.new }

	it 'should accept a bike' do
		expect(container.bike_count).to eq (0)
		container.dock(bike)
		expect(container.bike_count).to eq(1)
	end

	it 'should be able to release a bike' do
		container.dock(bike)
		container.dock(bike2)
		container.release(bike)
		expect(container.bikes).to eq [bike2]
	end

	it 'should know its capacity' do
		BikeContainer::DEFAULT_CAPACITY.times {container.dock(bike)}
		expect(container.full?).to be true
	end

	it 'should not accept bikes beyond capacity' do
		BikeContainer::DEFAULT_CAPACITY.times {container.dock(bike)}
		expect(lambda {container.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'should provide the list of working bikes' do
		working_bike = double :working_bike, broken?: false, instance_of?: true
		broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		container.dock(working_bike)
		container.dock(broken_bike)
		expect(container.working_bikes).to eq([working_bike])
	end

	it 'should know if it has no bikes' do
		expect(container.empty?).to be true
	end

	it 'should not release a bike if it is empty' do
		expect(lambda {container.release(bike)}).to raise_error(RuntimeError)
	end

	it 'should only accept bikes, not bananas' do
		expect(lambda {container.dock("banana")}).to raise_error(RuntimeError)
	end

	it 'should only release bikes, not bananas' do
		expect(lambda {container.release("banana")}).to raise_error(RuntimeError)
	end

	it 'should provide a list of broken bikes' do
		working_bike = double :working_bike, broken?: false, instance_of?: true
		broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		container.dock(working_bike)
		container.dock(broken_bike)
		expect(container.broken_bikes).to eq([broken_bike])
	end

	it 'should be able to select working bikes when working bikes selected' do
			
	end
end