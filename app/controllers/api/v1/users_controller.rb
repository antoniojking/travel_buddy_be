class Api::V1::UsersController < ApplicationController
  def show
    render(json: UserSerializer.new(User.find(params[:id])))
  end

  def create
    user = User.find_or_create_by(email: params[:email])
    user.update(spotify_id: params[:spotify_id], token: params[:token], refresh_token: params[:refresh_token])
    render(json: UserSerializer.new(user))
  end
end
