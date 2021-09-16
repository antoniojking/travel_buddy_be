class Api::V1::ActivitiesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: ActivitiesSerializer.new(trip.activities))
  end

  def create
    activity = Activity.create(activity_params)
    render(json: activity)
  end

  private

  def activity_params
    params.permit(:trip_id, :name)
  end
end
