require 'van'


describe Van do 
	let(:van) {Van.new}
	it 'collects broken bikes from the station' do
		station = double :station
		expect(station).to receive(:release)
		van.collect_bikes_from(station)
	end

	it 'has bike after collecting them' do
		bike = double :bike
		van.add_bike(bike)
		expect(van.bike_count).to eq(1)
	end

	it 'drops broken bikes at the garage' do
		garage = double :garage
		expect(garage).to receive(:accept)
		van.drops_bikes_at(garage)
	end



end