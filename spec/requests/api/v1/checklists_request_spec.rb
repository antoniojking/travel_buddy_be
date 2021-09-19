require 'rails_helper'

RSpec.describe 'Checklist API' do
  it 'can send all checklists for a trip' do
    trip = create(:trip)
    user = create(:user)
    user2 = create(:user)
    travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
    travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
    checklist1 = create(:checklist, trip: trip)
    checklist2 = create(:checklist, trip: trip)
    checklist3 = create(:checklist, trip: trip)
    checklist_item1 = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist1)
    checklist_item2 = ChecklistItem.create!(name: 'Pick Axe', user: user2, checklist: checklist2)
    checklist_item3 = ChecklistItem.create!(name: 'Sleeping Bag', user: user2, checklist: checklist3)

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
