require 'van'
require 'bike_container_spec'

describe Van do

	it_behaves_like 'a bike container'
	
	let (:van) { Van.new(:capacity => 100)}

	it 'should allow setting deault capacity on initialising' do
		expect(van.capacity).to eq(100)
	end	

end