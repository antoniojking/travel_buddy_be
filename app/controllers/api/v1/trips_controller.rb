class Api::V1::TripsController < ApplicationController
  def show
    render(json: TripSerializer.new(Trip.find(params[:id])))
  end

  def create
    trip = Trip.create!(trip_params)
    TravelBuddy.create(trip: trip, user_id: params[:user_id])
    render(json: TripSerializer.new(trip))
  end

  private

  def trip_params
    params.permit(:name, :start_date, :end_date, :park_code, :park_name, :user_id)
  end
end
