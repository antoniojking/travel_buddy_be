class Api::V1::ParksController < ApplicationController
  def index
    if state_present_and_not_blank?
      parks = ParkFacade.create_parks_by_state(params[:state])
      render(json: ParkSerializer.new(parks))
    elsif activity_present_and_not_blank?
      parks = ParkFacade.create_parks_by_activity(params[:activity])
      render(json: ErrorSerializer.no_activities_error, status: :bad_request) if parks.nil?

      render(json: ActivityParkSerializer.new(parks)) if !parks.nil?
    else
      render(json: ErrorSerializer.park_params_blank_or_missing, status: :bad_request)
    end
  end

  def show
    if params_id_included_and_not_blank?
      park = ParkFacade.create_parks_by_park_code(params[:id])
      render(json: ParkSerializer.new(park))
    else
      render(json: ErrorSerializer.park_params_id_blank_or_missing, status: :bad_request)
    end
  end

  private

  def state_present_and_not_blank?
    params[:state].present? && params[:state] != ''
  end

  def activity_present_and_not_blank?
    params[:activity].present? && params[:activity] != ''
  end

  def params_id_included_and_not_blank?
    params[:id].present? && params[:id] != ''
  end
end
