require 'rails_helper'

 RSpec.describe 'weather API' do
   it 'sends weather report based on location and number of days params', :vcr do
     get '/api/v1/weather', params: {lat: '37.5858662', lon: '-85.67330523'}

     expect(response).to be_successful

     weather = JSON.parse(response.body, symbolize_names: true)[:data]

     expect(weather).to have_key(:id)
     expect(weather[:id].class).to eq(String)
     expect(weather[:attributes]).to have_key(:current_temp)
     expect(weather[:attributes][:current_temp].class).to eq(Float)
     expect(weather[:attributes]).to have_key(:min_temp)
     expect(weather[:attributes][:min_temp].class).to eq(Float)
     expect(weather[:attributes]).to have_key(:max_temp)
     expect(weather[:attributes][:max_temp].class).to eq(Float)
     expect(weather[:attributes]).to have_key(:current_conditions)
     expect(weather[:attributes][:current_conditions].class).to eq(String)
   end

   it 'sad path: params do not include location or days', :vcr do
     get '/api/v1/weather'

     expect(response).to_not be_successful
     expect(response.status).to eq(400)
   end

   it 'edge case: params are included but in correct format', :vcr do
     get '/api/v1/weather', params: {lat: '', lon: ''}

     expect(response).to_not be_successful
     expect(response.status).to eq(400)
   end
 end
