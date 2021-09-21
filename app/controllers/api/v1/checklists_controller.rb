class Api::V1::ChecklistsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render(json: ChecklistSerializer.new(trip.checklists))
  end

  def show
    trip = Trip.find(params[:trip_id])
    checklist = Checklist.find(params[:id])
    render(json: ChecklistSerializer.new(checklist))
  end

  def create
    trip = Trip.find(params[:trip_id])
    checklist = trip.checklists.create!(checklist_params)
    render(json: ChecklistSerializer.new(checklist))
  end

  private

  def checklist_params
    params.permit(:category, :trip_id)
  end
end
