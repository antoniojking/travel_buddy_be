require 'rails_helper'

 RSpec.describe 'trip API' do
   it 'can create anew trip' do
     trip_params = {
       start_date: DateTime.new(2021, 11, 18),
       end_date: DateTime.new(2021, 12, 18),
       park_code: 'grte',
       name: 'Graduation Teton Trip'
     }

     post '/api/v1/trips', params: {trip: trip_params}

     expect(response).to be_successful

     trip = JSON.parse(response.body, symbolize_names: true)

     expect(trip).to have_key(:data)
     expect(trip[:data]).to have_key(:type)
     expect(trip[:data]).to have_key(:attributes)
     expect(trip[:data][:attributes]).to have_key(:name)
     expect(trip[:data][:attributes]).to have_key(:start_date)
     expect(trip[:data][:attributes]).to have_key(:end_date)
     expect(trip[:data][:attributes]).to have_key(:park_code)
   end

   it 'can send trip by trip id' do
     trip_id = create(:trip).id

     get "/api/v1/trips/#{trip_id}"

     expect(response).to be_successful

     trip = JSON.parse(response.body, symbolize_names: true)

     expect(trip).to have_key(:data)
     expect(trip[:data]).to have_key(:type)
     expect(trip[:data]).to have_key(:attributes)
     expect(trip[:data][:attributes]).to have_key(:name)
     expect(trip[:data][:attributes]).to have_key(:start_date)
     expect(trip[:data][:attributes]).to have_key(:end_date)
     expect(trip[:data][:attributes]).to have_key(:park_code)
   end
 end
