class Api::V1::TravelBuddiesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: UserSerializer.format_user_email(trip.users))
  end

  def create
    travel_buddy = TravelBuddy.create!(travel_buddy_params)
    render(json: TravelBuddySerializer.new(travel_buddy))
  end

  private

  def travel_buddy_params
    params.permit(:user_id, :trip_id)
  end
end
