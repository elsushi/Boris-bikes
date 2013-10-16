require 'docking_station'
require 'bike_container_spec'



describe DockingStation do 

	it_behaves_like 'a bike container'

	let (:station) {DockingStation.new(:capacity => 20)}
	let (:bike) { double :bike, broken?: false}
	let (:broken_bike) { double :bike, broken?: true}

	def fill_station(station)
		20.times {station.dock(Bike.new)}
	end
	
	it 'should accept a bike' do
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end
	it 'should release a working bike to a person' do
		station.dock(bike)
		station.release
		expect(station.bike_count).to eq 0
	end
	it 'should know when it is full' do
	  expect(station).to_not be_full
	  fill_station station
	  expect(station).to be_full
	end
	it 'should not accept a bike if the station is full' do
		fill_station station
		expect(lambda {station.dock(bike)}).to raise_error(RuntimeError)
	end
	it 'should provide the list of available bikes' do
		
		station.dock(bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq ([bike])
	end

	it 'should provide the list of unavailable bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.unavailable_bikes).to eq ([broken_bike])
	end

	it 'should release broken bikes to the van' do
		station.dock(broken_bike)
		station.release_broken_bikes
		expect(station.bike_count).to eq 0 #comment
	end

	
end