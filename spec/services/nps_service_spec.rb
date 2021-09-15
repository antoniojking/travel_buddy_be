require 'rails_helper'

 RSpec.describe NpsService do
   it 'can get national parks based off of state query params', :vcr do
     query = 'WY'

     parks = NpsService.get_nps_by_state(query)

     expect(parks[:data].count).to eq(10)

     parks[:data].each do |park|
       expect(park).to have_key(:parkCode)
       expect(park[:parkCode]).to be_a(String)
       expect(park).to have_key(:fullName)
       expect(park[:fullName]).to be_a(String)
       expect(park).to have_key(:description)
       expect(park[:description]).to be_a(String)
       expect(park).to have_key(:directionsInfo)
       expect(park[:directionsInfo]).to be_a(String)
     end
   end

   it 'can get national parks based off of activity query params', :vcr do
      query = 'Fishing'

      parks = NpsService.get_nps_by_activity(query)

      parks[:data][0][:parks].each do |park|
        expect(park).to have_key(:parkCode)
        expect(park[:parkCode]).to be_a(String)
        expect(park).to have_key(:fullName)
        expect(park[:fullName]).to be_a(String)
        expect(park).to have_key(:url)
        expect(park[:url]).to be_a(String)
      end
   end
 end
