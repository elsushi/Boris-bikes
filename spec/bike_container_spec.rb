shared_examples 'a bike container' do 
	
	let(:container) {described_class.new()}

	it 'can accept a bike' do
		expect(container.bike_count).to eq 0
		container.dock(bike)
		expect(container.bike_count).to eq 1
	end

end