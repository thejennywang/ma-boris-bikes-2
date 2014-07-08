require 'bike'

describe 'bike' do
	let  (:bike) { Bike.new }

	it 'should not be broken when created' do
		expect(bike.broken?).to be false
	end

	it 'should be able to be broken' do
		bike.break!
		expect(bike.broken?).to be true
	end

	it 'should be able to be fixed' do
		bike.break!
		bike.fix!
		expect(bike.broken?).to be false
	end
end