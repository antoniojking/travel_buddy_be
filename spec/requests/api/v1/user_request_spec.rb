require 'rails_helper'

RSpec.describe 'User API' do
  it 'can send one user info' do
    user1 = create(:user)
    user2 = create(:user)
    friendship = Friendship.create!(user: user1, friend: user2)
    trip = create(:trip)
    travel_buddy = TravelBuddy.create!(trip: trip, user: user2)
    travel_buddy2 = TravelBuddy.create!(trip: trip, user: user1)

    trip2 = create(:trip, name: 'Grand Canyon')
    travel_buddy3 = TravelBuddy.create!(trip: trip2, user: user1)
    travel_buddy4 = TravelBuddy.create!(trip: trip2, user: user2)

    get "/api/v1/users/#{user1.id}"

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:first_name)
    expect(user[:data][:attributes]).to have_key(:last_name)
    expect(user[:data][:attributes]).to have_key(:trips)
    expect(user[:data][:attributes]).to have_key(:friends)
  end
end
