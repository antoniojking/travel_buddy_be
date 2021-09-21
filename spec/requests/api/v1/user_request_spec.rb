require 'rails_helper'

RSpec.describe 'User API' do
  it 'can send one user info' do
    allow(Date).to receive(:today).and_return Date.new(2021, 9, 13)

    user = create(:user)
    trip1 = create(:trip, start_date: DateTime.new(2021, 9, 11), end_date: DateTime.new(2021, 9, 18), user: user)
    trip2 = create(:trip, start_date: DateTime.new(2021, 12, 18), end_date: DateTime.new(2021, 12, 30), user: user)
    trip3 = create(:trip, start_date: DateTime.new(2021, 4, 18), end_date: DateTime.new(2021, 5, 30), user: user)
    trip4 = create(:trip, start_date: nil, end_date: nil, user: user)
    user2 = create(:user)
    friendship = Friendship.create!(user: user, friend: user2)
    travel_buddy = TravelBuddy.create!(trip: trip1, user: user2)
    travel_buddy2 = TravelBuddy.create!(trip: trip1, user: user)

    travel_buddy3 = TravelBuddy.create!(trip: trip2, user: user)
    travel_buddy4 = TravelBuddy.create!(trip: trip2, user: user2)
    travel_buddy5 = TravelBuddy.create!(trip: trip3, user: user)
    travel_buddy6 = TravelBuddy.create!(trip: trip3, user: user2)
    travel_buddy7 = TravelBuddy.create!(trip: trip4, user: user)

    get "/api/v1/users/#{user.id}"

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:token)
    expect(user[:data][:attributes]).to have_key(:refresh_token)
    expect(user[:data][:attributes]).to have_key(:spotify_id)
    expect(user[:data][:attributes]).to have_key(:upcoming_trips)
    expect(user[:data][:attributes]).to have_key(:current_trips)
    expect(user[:data][:attributes]).to have_key(:past_trips)
    expect(user[:data][:attributes]).to have_key(:friends)
  end

  it 'sad path: it will not send a user if it cannot find that user' do
    get "/api/v1/users/1234"

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
  end

  it 'can create a new user' do
    user_params = {
      spotify_id: 'aso98haksjbc09',
      token: '109283yyrbadso8734gr',
      refresh_token: 'qp398cbqwiobc983q4yfkajbsv',
      email: 'test@test.com'
    }
    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:spotify_id)
    expect(user[:data][:attributes]).to have_key(:token)
    expect(user[:data][:attributes]).to have_key(:refresh_token)

    user = User.last

    expect(user.spotify_id).to eq(user_params[:spotify_id])
    expect(user.email).to eq(user_params[:email])
    expect(user.token).to eq(user_params[:token])
    expect(user.refresh_token).to eq(user_params[:refresh_token])
  end

  it 'can find an existing user' do
    user = create(:user)
    user_params = {
      email: user.email
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:token)
    expect(user[:data][:attributes]).to have_key(:refresh_token)
    expect(user[:data][:attributes]).to have_key(:spotify_id)
  end
end
