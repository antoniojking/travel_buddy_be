require 'rails_helper'

RSpec.describe 'Friendship API' do
  describe 'happy path' do
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

    it 'creates a new friendship with a friend email' do
      user1 = create(:user)
      user2 = create(:user)
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users/#{user1.id}/friendships", headers: headers, params: JSON.generate({ email: user2.email})

      expect(response).to be_successful

      friendship = Friendship.last

      expect(friendship.user_id).to eq(user1.id)
      expect(friendship.friend_id).to eq(user2.id)
    end
  end

  describe 'sad path' do
    it 'will not create a friendship if friend email does not belong to a user' do
      user1 = create(:user)
      user2 = create(:user)
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users/#{user1.id}/friendships", headers: headers, params: JSON.generate({ email: 'test@test.com' })

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end
  end
end
