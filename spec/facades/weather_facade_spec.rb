require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can create weather info', :vcr do
      expected = {
        id: "Boulder",
        current_conditions: "Sunny",
        current_temp: 60.8,
        forecast:[{condition: "Patchy rain possible", date: "2021-09-20", max_temp: 70.3, min_temp: 42.4}, {condition: "Partly cloudy", date: "2021-09-21", max_temp: 68.0, min_temp: 37.6}]
      }

      weather_info = WeatherFacade.weather_info('boulder', 2)
      expect(weather_info).to eq(expected)
  end

  it 'can create a weather instance', :vcr do
    weather = WeatherFacade.create_weather('boulder', 3)
    expect(weather).to be_an_instance_of(Weather)
  end
end
