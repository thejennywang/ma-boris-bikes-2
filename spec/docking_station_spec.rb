require 'docking_station'
require 'bike'

describe DockingStation do

	let (:bike) { double :bike }
	let (:old_street) { DockingStation.new }
	let (:moorgate) {DockingStation.new(:capacity => 30)}

	it 'has no bikes when created' do
		expect(old_street.bikes).to eq []
	end

	it 'should know its capacity if not using the default' do
		30.times {moorgate.dock(Bike.new)}
		expect(moorgate.full?).to be true
	end

end