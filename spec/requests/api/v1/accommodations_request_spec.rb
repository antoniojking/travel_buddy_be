require 'rails_helper'

RSpec.describe 'accommodations api' do
  it 'can create a new accommodation' do
    trip = create(:trip)
    accommodation_params = {
      name: 'Camp 4',
      location: 'Yosemite Valley',
      details: 'Pitch your test behind the large boulder'
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/trips/#{trip.id}/accommodations", headers: headers, params: JSON.generate(accommodation: accommodation_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    accommodation = Accommodation.last

    expect(accommodation.name).to eq(accommodation_params[:name])
    expect(accommodation.location).to eq(accommodation_params[:location])
    expect(accommodation.details).to eq(accommodation_params[:details])
  end

  it 'can send a list of a trips accommodations' do
    trip = create(:trip)
    accommodation1 = create(:accommodation, trip: trip)
    accommodation2 = create(:accommodation, trip: trip)

    get "/api/v1/trips/#{trip.id}/accommodations"

    expect(response).to be_successful

    accommodations = JSON.parse(response.body, symbolize_names: true)

    expect(accommodations).to have_key(:data)

    accommodations[:data].each do |accommodation|
      expect(accommodation).to have_key(:id)
      expect(accommodation).to have_key(:attributes)
      expect(accommodation[:attributes]).to have_key(:name)
      expect(accommodation[:attributes]).to have_key(:location)
      expect(accommodation[:attributes]).to have_key(:details)
    end
  end
end
