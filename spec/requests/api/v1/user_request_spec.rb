require 'rails_helper'

RSpec.describe 'User API' do
  it 'can send one user info' do
    user = create(:user)
    user2 = create(:user)
    friendship = Friendship.create!(user: user, friend: user2)
    trip = create(:trip, user: user)
    travel_buddy = TravelBuddy.create!(trip: trip, user: user2)
    travel_buddy2 = TravelBuddy.create!(trip: trip, user: user)

    trip2 = create(:trip, name: 'Grand Canyon', user: user2)
    travel_buddy3 = TravelBuddy.create!(trip: trip2, user: user)
    travel_buddy4 = TravelBuddy.create!(trip: trip2, user: user2)

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
    expect(user[:data][:attributes]).to have_key(:trips)
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
