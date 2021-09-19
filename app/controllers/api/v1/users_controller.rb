class Api::V1::UsersController < ApplicationController
  def show
    render(json: UserSerializer.new(User.find(params[:id])))
  end

  def create
    user = User.find_or_create_by(email: params[:user][:email])
    user.update(spotify_id: params[:user][:spotify_id], token: params[:user][:token], refresh_token: params[:user][:refresh_token])
    render(json: UserSerializer.new(user))
  end

  # private
  #
  # def user_params
  #   params.require(:user).permit(:spotify_id, :token, :refresh_token, :email)
  # end
end
