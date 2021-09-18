require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can create weather info', :vcr do
      expected = {
        id: "Boulder",
        current_conditions: "Sunny",
        current_temp: 86.0,
        forecast: [{condition: "Partly cloudy", date: "2021-09-17", max_temp: 74.3, min_temp: 41.5}, {condition: "Partly cloudy", date: "2021-09-18", max_temp: 87.4, min_temp: 55.4}]
      }

      weather_info = WeatherFacade.weather_info('boulder', 2)
      expect(weather_info).to eq(expected)
  end

  it 'can create a weather instance', :vcr do
    weather = WeatherFacade.create_weather('boulder', 3)
    expect(weather).to be_an_instance_of(Weather)
  end
end
