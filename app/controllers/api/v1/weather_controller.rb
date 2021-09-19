class Api::V1::WeatherController < ApplicationController
  def index
    if params_includes?
      render(json: ErrorSerializer.weather_params_not_included, status: :bad_request)
    elsif params_are_empty?
      render(json: ErrorSerializer.weather_params_are_empty, status: :bad_request)
    else
      weather = WeatherFacade.create_weather(params[:location], params[:days])
    render(json: WeatherSerializer.new(weather))
    end
  end

  private

  def params_includes?
    !params[:location].present? || !params[:days].present?
  end

  def params_are_empty?
    params[:location] == '' || params[:days] == ''
  end
end
