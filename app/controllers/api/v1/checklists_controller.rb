class Api::V1::ChecklistsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: ChecklistSerializer.new(trip.checklists))
  end
end
