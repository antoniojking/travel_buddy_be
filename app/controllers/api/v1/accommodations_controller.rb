# class Api::V1::AccommodationsController < ApplicationController
#   def index
#     trip = Trip.find(params[:trip_id])
#     render(json: AccommodationsSerializer.new(trip.accommodations))
#   end
#
#   def create
#     trip = Trip.find(params[:trip_id])
#     accommodation = trip.accommodations.create(accommodation_params)
#     render(json: AccommodationsSerializer.new(accommodation))
#   end
#
#   private
#
#   def accommodation_params
#     params.require(:accommodation).permit(:name, :location, :details)
#   end
# end
