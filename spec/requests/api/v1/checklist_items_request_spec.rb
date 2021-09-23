require 'rails_helper'

RSpec.describe 'checklist items api' do
  describe 'happy path' do
    it 'can create a new checklist item' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item_params = {
        name: 'Tent',
        user_id: user.id,
        user_email: user.email
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items", headers: headers, params: JSON.generate(checklist_item_params)

      expect(response).to be_successful

      checklist_item = ChecklistItem.last

      expect(checklist_item.name).to eq(checklist_item_params[:name])
      expect(checklist_item.user_id).to eq(checklist_item_params[:user_id])
      expect(checklist_item.checklist_id).to eq(checklist.id)
      expect(checklist_item.user_email).to eq(checklist_item_params[:user_email])
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

    it 'can update an existing checklist item' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)
      previous_name = checklist_item.name

      checklist_item_params = {
        name: 'Sleeping Bag',
        user_id: user.id
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items/#{checklist_item.id}", headers: headers, params: JSON.generate(checklist_item_params)

      expect(response).to be_successful

      found_checklist_item = ChecklistItem.find(checklist_item.id)

      expect(found_checklist_item.name).to_not eq(previous_name)
      expect(found_checklist_item.name).to eq('Sleeping Bag')
    end

    it 'can delete an existing checklist item' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)

      expect(ChecklistItem.count).to eq(1)

      delete "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items/#{checklist_item.id}"

      expect(response).to be_successful

      expect(ChecklistItem.count).to eq(0)
      expect{ChecklistItem.find(checklist_item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'sad path' do
    it 'will not create a check list item if some params are missing' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item_params = {
        user_id: user.id
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items", headers: headers, params: JSON.generate(checklist_item_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end

    it 'will not update a check list item if id is incorrect' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)
      checklist_item_params = {
        name: 'Sleeping Bag'
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items/1329843", headers: headers, params: JSON.generate(checklist_item_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end

    it 'will not update a check list item if params are missing' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)

      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items/#{checklist_item.id}"

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end

    it 'will not delete a check list item if id is incorrect' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create(user: user, trip: trip)
      travel_buddy2 = TravelBuddy.create(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist_item = ChecklistItem.create!(name: 'Tent', user: user, checklist: checklist)

      delete "/api/v1/trips/#{trip.id}/checklists/#{checklist.id}/checklist_items/312432"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end
  end
end
