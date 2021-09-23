class Api::V1::WeatherController < ApplicationController
  def index

      weather = WeatherFacade.create_weather(params[:lat], params[:lon])
    render(json: WeatherSerializer.new(weather))
  end

  private

  # def params_included?
  #   !params[:location].present? || !params[:days].present?
  # end
  #
  # def params_are_empty?
  #   params[:location] == '' || params[:days] == ''
  # end
end
