class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: FriendshipSerializer.new(user.friends)
  end

  def create
    Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
  end
end
