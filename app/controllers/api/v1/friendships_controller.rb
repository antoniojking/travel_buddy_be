class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: UserSerializer.format_user_email(user.friends)
  end

  def create
    friend = Friendship.create(friendship_params)
    render(json: FriendshipSerializer.new(friend))
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
