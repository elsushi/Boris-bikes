require 'garage'
# require 'bike_container_spec'
describe Garage do

	# it_behaves_like 'a bike container'

	let(:garage) {Garage.new}
	let(:bike) {double :bike, broken?: :false}
	let(:broken_bike) {double :bike, broken?: :true}

	# it 'should accept bikes' do
	# 	expect(garage.bike_count).to eq 0	
	# 	garage.dock(broken_bike)
	# 	expect(garage.bike_count).to eq 1
	# end

	it 'should accept only BROKEN bikes' do
		expect(garage.bike_broken?).to be(true)
	end

	it 'should fix bikes' do
		garage.fix(broken_bike)
		expect(garage.bike_broken?).to eq false
	end

	it 'should deliver FIXED bikes' do
		garage.dock(broken_bike)
		garage.fix(broken_bike)
		expect(garage.bike_broken?).to eq false
		bike = broken_bike
		garage.release(bike)
		expect(garage.bike_count).to eq 0
	end


end