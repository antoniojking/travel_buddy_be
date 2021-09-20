require 'rails_helper'

RSpec.describe 'checklist items api' do
  it 'can create a new checklist item' do
    user = create(:user)
    trip = create(:trip, user: user)
    user2 = create(:user)
    travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
    travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
    checklist = create(:checklist, trip: trip)
    checklist_item_params = {
      name: 'Tent',
      user_id: user.id
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items", headers: headers, params: JSON.generate(checklist_item_params)

    expect(response).to be_successful

    checklist_item = ChecklistItem.last

    expect(checklist_item.name).to eq(checklist_item_params[:name])
    expect(checklist_item.user_id).to eq(checklist_item_params[:user_id])
    expect(checklist_item.checklist_id).to eq(checklist.id)
  end

  it 'can show a list of checklist items for a trip' do
    user = create(:user)
    trip = create(:trip, user: user)
    user2 = create(:user)
    travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
    travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
    checklist = create(:checklist, trip: trip)
    checklist_item1 = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)
    checklist_item2 = ChecklistItem.create!(name: 'Pick Axe', user: user2, checklist: checklist)

    get "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items"

    expect(response).to be_successful

    checklist_items = JSON.parse(response.body, symbolize_names: true)

    expect(checklist_items).to have_key(:data)

    checklist_items[:data].each do |checklist_item|
      expect(checklist_item).to have_key(:attributes)
      expect(checklist_item[:attributes]).to have_key(:name)
      expect(checklist_item[:attributes]).to have_key(:user_id)
      expect(checklist_item[:attributes]).to have_key(:user_email)
      expect(checklist_item).to have_key(:type)
    end
  end
end
