require 'van'

describe Van do
	
	let (:van) { Van.new(:capacity => 100)}

	it 'should allow setting deault capacity on initialising' do
		expect(van.capacity).to eq(100)
	end

	

end