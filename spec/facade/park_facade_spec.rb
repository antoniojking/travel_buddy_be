require 'rails_helper'

RSpec.describe ParkFacade do
  describe 'park creation' do
    it 'can create parks based off of state search query', :vcr do
      parks = ParkFacade.create_parks_by_state('WY')
      expect(parks.count).to eq(10)

      parks.each do |park|
        expect(park).to be_a(Park)
      end
    end
  end
end