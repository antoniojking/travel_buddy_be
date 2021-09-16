require 'rails_helper'

RSpec.describe 'Friendship API' do
  it 'sends a list of all friendships and attributes' do
    user1 = create(:user).id
    user2 = create(:user).id

    Friendship.create!(user_id: user1, friend_id: user2)

    get "/api/v1/users/#{user1}/friendships"

    expect(response).to be_successful

    friendships = JSON.parse(response.body, symbolize_names: true)

    expect(friendships[:data]).to be_a(Array)

    expect(friendships[:data][0]).to have_key(:id)
    expect(friendships[:data][0]).to have_key(:type)
    expect(friendships[:data][0]).to have_key(:attributes)
    expect(friendships[:data][0][:attributes]).to have_key(:email)
  end

  it 'creates a new friendship' do
    user1 = create(:user).id
    user2 = create(:user).id

    post "/api/v1/users/#{user1}/friendships", params: { friend_id: user2}

    expect(response).to be_successful

    friendship = Friendship.last

    expect(friendship.user_id).to eq(user1)
    expect(friendship.friend_id).to eq(user2)
  end
end
