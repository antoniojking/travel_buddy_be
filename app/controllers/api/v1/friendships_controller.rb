class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: UserSerializer.format_user_email(user.friends)
  end

  def create
    friend = User.find_by(email: params[:email])
    user = User.find(params[:user_id])

    if !friend.nil?
      friendship = Friendship.create!(user_id: user.id, friend_id: friend.id)
      render(json: FriendshipSerializer.new(friendship))
    else
      render(json: ErrorSerializer.friendship_not_created, status: :bad_request)
    end
  end
end
