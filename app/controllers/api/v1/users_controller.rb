class Api::V1::UsersController < ApplicationController
  def show
    render(json: UserSerializer.new(User.find(params[:id])))
  end

  def create
    user = User.find_or_create_by(user_params)
    render(json: UserSerializer.new(user))
  end

  private

  def user_params
    params.require(:user).permit(:authorization_token, :refresh_token, :email)
  end
end
