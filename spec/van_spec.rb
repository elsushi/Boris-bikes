require 'van'


describe Van do 
	let(:van) {Van.new}
	it 'collects broken bikes from the station' do
		station = double :station
		expect(station).to receive(:release)
		van.collect_bikes_from(station)
	end

	it 'has broken bikes after collecting them from the station' do
		station = double :station, release: :bike
		van.collect_bikes_from station
		expect(van.bike_count).to eq(1)
	end

	it 'drops broken bikes at the garage' do
		garage = double :garage
		expect(garage).to receive(:accept)
		van.drops_bikes_at(garage)
	end

	it 'should know when its full' do
		bike = double :bike
		expect(van).not_to be_full 
		20.times {van.add_bike(bike)}
		expect(van).to be_full
	end

	it 'picks-up fixed bikes from the garage' do
		garage = double :garage
		expect(garage).to receive(:release)
		van.collect_bikes_from(garage) 
	end

	it 'has fixed bikes after collecting them from the garage' do
		garage = double :garage, release: :bike
		van.collect_bikes_from garage
		expect(van.bike_count).to eq(1)
	end

	it 'drops fixed bikes at the station' do
		station = double :station
		expect(station).to receive(:accept)
		van.drops_bikes_at station
	end


end