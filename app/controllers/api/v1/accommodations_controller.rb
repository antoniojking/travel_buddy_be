class Api::V1::AccommodationsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: AccommodationSerializer.new(trip.accommodations))
  end

  def create
    trip = Trip.find(params[:trip_id])
    accommodation = trip.accommodations.create(accommodation_params)
    render(json: AccommodationSerializer.new(accommodation))
  end

  private

  def accommodation_params
    params.permit(:name, :location, :details)
  end
end
