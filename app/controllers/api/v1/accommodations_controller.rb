class Api::V1::AccommodationsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: AccommodationSerializer.new(trip.accommodations))
  end

  def show
    trip = Trip.find(params[:trip_id])
    accommodation = Accommodation.find(params[:id])
    render(json: AccommodationSerializer.new(accommodation))
  end

  def create
    trip = Trip.find(params[:trip_id])
    accommodation = trip.accommodations.create!(accommodation_params)
    render(json: AccommodationSerializer.new(accommodation))
  end

  def update
    render(json: AccommodationSerializer.new(Accommodation.update(params[:id], accommodation_params)))
  end

  def destroy
    accommodation = Accommodation.find(params[:id])
    accommodation.destroy
  end

  private

  def accommodation_params
    params.permit(:name, :location, :details)
  end
end
