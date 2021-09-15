class Api::V1::ParksController < ApplicationController
  def index
    if params[:state]
      render json: NpsService.get_nps_by_state(params[:state])
    else params[:activity]
      render json: NpsService.get_nps_by_activity(params[:activity])
    end
  end

  def show
    render json: NpsService.get_nps_by_parkcode(params[:id])
  end
end
