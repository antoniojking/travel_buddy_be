class Api::V1::WeatherController < ApplicationController
  def index
    if params_included? || params_are_empty?
      render(json: ErrorSerializer.weather_params_not_included, status: :bad_request)
    else
      weather = WeatherFacade.create_weather(params[:lat], params[:lon])
      render(json: WeatherSerializer.new(weather))
    end
  end

  private

  def params_included?
    !params[:lat].present? || !params[:lon].present?
  end

  def params_are_empty?
    params[:lat] == '' || params[:lon] == ''
  end
end
