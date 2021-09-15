require 'rails_helper'

RSpec.describe 'Parks API' do
  it 'sends parks based off of state query params', :vcr do
    get '/api/v1/parks', params: { state: 'WY' }

    expect(response).to be_successful

    parks = JSON.parse(response.body, symbolize_names: true)

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

  it 'sends parks based off of activity query params', :vcr do
    get '/api/v1/parks', params: { activity: 'Fishing' }

    expect(response).to be_successful

    parks = JSON.parse(response.body, symbolize_names: true)

    parks[:data][0][:parks].each do |park|
      expect(park).to have_key(:parkCode)
      expect(park[:parkCode]).to be_a(String)
      expect(park).to have_key(:fullName)
      expect(park[:fullName]).to be_a(String)
      expect(park).to have_key(:url)
      expect(park[:url]).to be_a(String)
    end
  end

  it 'sends specific national park by parkcode', :vcr do
    get '/api/v1/parks/grte'

    expect(response).to be_successful

    parks = JSON.parse(response.body, symbolize_names: true)

    expect(parks[:data][0]).to have_key(:description)
    expect(parks[:data][0][:description]).to be_a(String)
    expect(parks[:data][0]).to have_key(:entranceFees)
    expect(parks[:data][0][:entranceFees][0]).to have_key(:cost)
    expect(parks[:data][0][:entranceFees][0]).to have_key(:description)
    expect(parks[:data][0]).to have_key(:directionsInfo)
    expect(parks[:data][0]).to have_key(:images)
  end
end
