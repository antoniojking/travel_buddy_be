require 'rails_helper'

 RSpec.describe 'weather API' do
   it 'sends weather report based on location and number of days params', :vcr do
     get '/api/v1/weather', params: {location: 'Estes Park', days: 2}

     expect(response).to be_successful

     weather = JSON.parse(response.body, symbolize_names: true)[:data]

     expect(weather).to have_key(:id)
     expect(weather[:id].class).to eq(String)
     expect(weather[:attributes]).to have_key(:current_temp)
     expect(weather[:attributes][:current_temp].class).to eq(Float)
     expect(weather[:attributes]).to have_key(:current_conditions)
     expect(weather[:attributes][:current_conditions].class).to eq(String)
     expect(weather[:attributes]).to have_key(:forecast)
     expect(weather[:attributes][:forecast].class).to eq(Array)
     expect(weather[:attributes][:forecast].count).to eq(2)
     expect(weather[:attributes][:forecast][0]).to have_key(:date)
     expect(weather[:attributes][:forecast][0][:date].class).to eq(String)
     expect(weather[:attributes][:forecast][0]).to have_key(:max_temp)
     expect(weather[:attributes][:forecast][0][:max_temp].class).to eq(Float)
     expect(weather[:attributes][:forecast][0]).to have_key(:min_temp)
     expect(weather[:attributes][:forecast][0][:min_temp].class).to eq(Float)
   end
 end