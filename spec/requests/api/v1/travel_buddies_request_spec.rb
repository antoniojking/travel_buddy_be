require 'rails_helper'

 RSpec.describe 'travel buddies api' do
   describe 'happy path' do
   it 'can send a list of a trips travel buddies' do
     user = create(:user)
     trip = create(:trip, user: user)
     user2 = create(:user)
     travel_buddy1 = TravelBuddy.create!(user: user, trip: trip)
     travel_buddy2 = TravelBuddy.create!(user: user2, trip: trip)

     get "/api/v1/trips/#{trip.id}/travel_buddies"

     expect(response).to be_successful

     travel_buddies = JSON.parse(response.body, symbolize_names: true)

     expect(travel_buddies[:data]).to be_a(Array)

     expect(travel_buddies[:data][0]).to have_key(:id)
     expect(travel_buddies[:data][0]).to have_key(:type)
     expect(travel_buddies[:data][0]).to have_key(:attributes)
     expect(travel_buddies[:data][0][:attributes]).to have_key(:email)
   end

   it 'can create a new travel buddy' do
     user = create(:user)
     trip = create(:trip, user: user)
     travel_buddy_params = {
       trip_id: trip.id,
       user_id: user.id
     }
     headers = {"CONTENT_TYPE" => "application/json"}

     post "/api/v1/trips/#{trip.id}/travel_buddies", headers: headers, params: JSON.generate(travel_buddy_params)

     expect(response).to be_successful

     travel_buddy = TravelBuddy.last

     expect(travel_buddy.user_id).to eq(user.id)
     expect(travel_buddy.trip_id).to eq(trip.id)
   end
 end

  describe 'sad path' do
    it 'wont create a travel buddy if some params are missing' do
      user = create(:user)
      trip = create(:trip, user: user)
      travel_buddy_params = {
        trip_id: trip.id
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/trips/#{trip.id}/travel_buddies", headers: headers, params: JSON.generate(travel_buddy_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end
  end
 end
