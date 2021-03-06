require 'rails_helper'

RSpec.describe 'Parks API' do
  describe 'happy path' do
    it 'sends parks based off of state query params', :vcr do
      get '/api/v1/parks', params: { state: 'WY' }

      expect(response).to be_successful

      parks = JSON.parse(response.body, symbolize_names: true)
      expect(parks[:data].count).to eq(10)

      parks[:data].each do |park|
        expect(park).to have_key(:id)
        expect(park[:id]).to be_a(String)
        expect(park[:attributes]).to have_key(:name)
        expect(park[:attributes][:name]).to be_a(String)
        expect(park[:attributes]).to have_key(:description)
        expect(park[:attributes][:description]).to be_a(String)
        expect(park[:attributes]).to have_key(:directions)
        expect(park[:attributes][:directions]).to be_a(String)
        expect(park[:attributes]).to have_key(:operating_hours)
        expect(park[:attributes][:operating_hours]).to be_an(Array)
        expect(park[:attributes]).to have_key(:images)
        expect(park[:attributes][:images]).to be_an(Array)
        expect(park[:attributes]).to have_key(:states)
        expect(park[:attributes][:states]).to be_an(Array)
        expect(park[:attributes]).to have_key(:lat)
        expect(park[:attributes][:lat]).to be_an(String)
        expect(park[:attributes]).to have_key(:lon)
        expect(park[:attributes][:lon]).to be_an(String)
      end
    end

    it 'sends parks based off of activity query params', :vcr do
      get '/api/v1/parks', params: { activity: 'Fishing' }

      expect(response).to be_successful

      parks = JSON.parse(response.body, symbolize_names: true)

      parks[:data].each do |park|
        expect(park).to have_key(:id)
        expect(park[:id]).to be_a(String)
        expect(park).to have_key(:attributes)
        expect(park[:attributes]).to be_a(Hash)
        expect(park[:attributes]).to have_key(:name)
        expect(park[:attributes][:name]).to be_a(String)
      end
    end

    it 'sends specific national park by parkcode', :vcr do
      get '/api/v1/parks/grte'

      expect(response).to be_successful

      park = JSON.parse(response.body, symbolize_names: true)[:data][0]

      expect(park).to have_key(:id)
      expect(park[:id]).to be_a(String)
      expect(park[:attributes]).to have_key(:name)
      expect(park[:attributes][:name]).to be_a(String)
      expect(park[:attributes]).to have_key(:description)
      expect(park[:attributes][:description]).to be_a(String)
      expect(park[:attributes]).to have_key(:directions)
      expect(park[:attributes][:directions]).to be_a(String)
      expect(park[:attributes]).to have_key(:operating_hours)
      expect(park[:attributes][:operating_hours]).to be_an(Array)
      expect(park[:attributes]).to have_key(:images)
      expect(park[:attributes][:images]).to be_an(Array)
      expect(park[:attributes]).to have_key(:states)
      expect(park[:attributes][:states]).to be_an(Array)
      expect(park[:attributes]).to have_key(:lat)
      expect(park[:attributes][:lat]).to be_an(String)
      expect(park[:attributes]).to have_key(:lon)
      expect(park[:attributes][:lon]).to be_an(String)
    end
  end

  describe 'sad path' do
    it 'will not sends specific national park by parkcode', :vcr do
      get '/api/v1/parks/'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end

    it 'sad path: params include a blank state', :vcr do
      get '/api/v1/parks', params: { state: ''}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end

    it 'edge case: params do not include a state', :vcr do
      get '/api/v1/parks'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end


    it 'sad path: params include a blank activity', :vcr do
      get '/api/v1/parks', params: { activity: ''}

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end

    it 'edge case: params do not include a activity', :vcr do
      get '/api/v1/parks'

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end

    it 'will render an error response if no parks have activity', :vcr do
      get '/api/v1/parks', params: { activity: 'Paint Balling' }

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
      expect(error).to have_key(:status)
    end
  end
end
