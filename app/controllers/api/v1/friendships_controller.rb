class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: UserSerializer.format_user_email(user.friends)
  end

  def create
    friend = User.find_by(email: params[:email])
    user = User.find(params[:user_id])
    friendship = Friendship.create!(user: user, friend_id: friend.id)
    render(json: FriendshipSerializer.new(friendship))
  end
end
