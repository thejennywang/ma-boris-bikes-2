require 'van'
require 'bike_container_spec'

describe Van do

	it_behaves_like 'a bike container'

	let (:broken_bike)          { double :broken_bike,  broken?: true, instance_of?: true }
	let (:van)                  { Van.new(:capacity => 100)                               }
	let (:van_with_broken_bike) { Van.new(bikes: [broken_bike])                           }
	let (:working_bike)         {double :working_bike, broken?: false, instance_of?: true	}
	let (:van_with_working_bike){ Van.new(bikes: [working_bike])                          }

	it 'should allow setting deault capacity on initialising' do
		expect(van.capacity).to eq(100)
	end	

	it 'should pick up broken bikes from station' do
		station = double :station, broken_bikes: [broken_bike], release: :bike
		expect(van).to receive(:dock).with(broken_bike)
		van.pick_up_broken_bikes(station)	
	end

	it 'should remove broken bikes from station' do
		broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		station = double :station, broken_bikes: [broken_bike], release: :bike
		expect(station).to receive(:release).with(broken_bike)
		van.pick_up_broken_bikes(station)
	end

	it 'should release broken bikes to garage' do
		# broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		garage = double :garage, broken_bikes: [broken_bike], release: :bike, dock: :bike
		# van.dock(broken_bike)
		expect(van_with_broken_bike).to receive(:release).with(broken_bike)
		van_with_broken_bike.release_broken_bikes(garage)	
	end

	it 'should add broken bikes to the garage' do
		broken_bike = double :broken_bike,  broken?: true, instance_of?: true
		garage = double :garage, dock: :bike
		van.dock(broken_bike)
		expect(garage).to receive(:dock).with(broken_bike)
		van.release_broken_bikes(garage)
	end

	it 'should pick up working bikes from garage' do
	 	garage = double :garage, available_bikes: [working_bike], release: :bike
		expect(van).to receive(:dock).with(working_bike)
		van.pick_up_working_bikes(garage)	
	end

	it 'should remove working bikes from garage' do
	 	garage = double :garage, available_bikes: [working_bike], release: :bike
		expect(garage).to receive(:release).with(working_bike)
		van.pick_up_working_bikes(garage)	
	end

	it 'should release working bikes to docking stations' do
		station = double :station, available_bikes: [working_bike], dock: :bike
		expect(van_with_working_bike).to receive(:release).with(working_bike)
		van_with_working_bike.release_working_bikes(station)	
	end

	it 'should dock working bikes to docking stations' do
		station = double :station, available_bikes: [working_bike], dock: :bike
		expect(station).to receive(:dock).with(working_bike)
		van_with_working_bike.release_working_bikes(station)	
	end

end