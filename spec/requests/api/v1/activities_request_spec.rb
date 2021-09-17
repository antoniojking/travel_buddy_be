require 'rails_helper'

RSpec.describe 'Activities API' do
  it 'can send a list of a trips activities' do
    trip = create(:trip)
    activity1 = create(:activity, trip: trip)
    activity2 = create(:activity, trip: trip)

    get "/api/v1/trips/#{trip.id}/activities"

    expect(response).to be_successful

    activities = JSON.parse(response.body, symbolize_names: true)

    expect(activities).to have_key(:data)

    activities[:data].each do |activity|
      expect(activity).to have_key(:id)
      expect(activity).to have_key(:attributes)
      expect(activity[:attributes]).to have_key(:name)
    end
  end

  it 'can create a new activity for a trip' do
    trip = create(:trip)

    activity_params = {
      name: "Skiing"
    }

    post "/api/v1/trips/#{trip.id}/activities", params: activity_params

    expect(response).to be_successful

    activity = Activity.last

    expect(activity.trip_id).to eq(trip.id)
    expect(activity.name).to eq("Skiing")
  end
end