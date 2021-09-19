require 'rails_helper'

RSpec.describe 'Checklist API' do
  it 'can send all checklists for a trip' do
    trip = create(:trip)
    checklist1 = create(:checklist, trip: trip)
    checklist2 = create(:checklist, trip: trip)
    checklist3 = create(:checklist, trip: trip)

    get "/api/v1/trips/#{trip.id}/checklists"

    expect(response).to be_successful

    checklists = JSON.parse(response.body, symbolize_names: true)

    expect(checklists).to have_key(:data)

    checklists[:data].each do |checklist|
      expect(checklist).to have_key(:id)
      expect(checklist).to have_key(:attributes)
      expect(checklist[:attributes]).to have_key(:category)
      expect(checklist[:attributes]).to have_key(:item_count)
    end
  end

  it 'can create a new checklist' do
    trip = create(:trip)
    headers = {"CONTENT_TYPE" => "application/json"}
    params = JSON.generate( checklist: { category: 'Snacks' })

    post "/api/v1/trips/#{trip.id}/checklists", headers: headers, params: params

    expect(response).to be_successful
    checklist = Checklist.last

    expect(checklist.category).to eq("Snacks")
    expect(checklist.trip_id).to eq(trip.id)
  end
end
