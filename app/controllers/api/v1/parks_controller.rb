class Api::V1::ParksController < ApplicationController
  def index
    if params[:state]
      parks = ParkFacade.create_parks_by_state(params[:state])
      render json: ParkSerializer.new(parks)
    else params[:activity]
      render json: NpsService.get_nps_by_activity(params[:activity])
    end
  end

  def show
    park = ParkFacade.create_parks_by_state(params[:state])
    render json: ParkSerializer.new(park)
  end
end
