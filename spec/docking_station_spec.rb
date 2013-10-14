require 'docking_station'



describe DockingStation do 

	let (:station) {DockingStation.new(:capacity => 20)}
	let (:bike) {Bike.new}
	
	it 'should accept a bike' do
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end
	it 'should release a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end
	it 'should know when it is full' do
	  expect(station).to_not be_full
	  20.times{ station.dock(Bike.new)}
	  expect(station).to be_full
	end
end