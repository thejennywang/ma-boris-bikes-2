require 'docking_station'
require 'bike'

describe Station do

	let (:bike) { Bike.new }
	let (:bike2) { Bike.new }
	let (:old_street) { Station.new }
	let (:moorgate) {Station.new(30)}

	it 'has no bikes when created' do
		expect(old_street.bikes).to eq []
	end

	it 'should be able to accept/dock a bike' do
		old_street.dock(bike)
		expect(old_street.bikes).to eq [bike]
	end

	it 'should be able to release a bike' do
		old_street.dock(bike)
		old_street.dock(bike2)
		old_street.release(bike)
		expect(old_street.bikes).to eq [bike2]
	end

	it 'should know its capacity' do
		Station::DEFAULT_CAPACITY.times {old_street.dock(Bike.new)}
		expect(old_street.full?).to be true
	end

	it 'should not accept bikes beyond capacity' do
		Station::DEFAULT_CAPACITY.times {old_street.dock(Bike.new)}
		expect(lambda {old_street.dock(Bike.new)}).to raise_error(RuntimeError)
	end

	it 'should know its capacity if not using the default' do
		30.times {moorgate.dock(Bike.new)}
		expect(moorgate.full?).to be true
	end

	it 'should provide the list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		old_street.dock(working_bike)
		old_street.dock(broken_bike)
		expect(old_street.available_bikes).to eq([working_bike])
	end

end