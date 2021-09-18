class Api::V1::WeatherController < ApplicationController
  def index
    weather = WeatherFacade.create_weather(params[:location], params[:days])
    render(json: WeatherSerializer.new(weather))
  end
end
