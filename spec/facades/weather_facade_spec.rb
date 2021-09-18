require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can create weather info', :vcr do
      expected = {
        id: "Boulder",
        current_conditions: "Mist",
        current_temp: 86.0,
        forecast:[{condition: "Patchy rain possible", date: "2021-09-18", max_temp: 85.5, min_temp: 53.4}, {condition: "Partly cloudy", date: "2021-09-19", max_temp: 82.6, min_temp: 53.6}]
      }

      weather_info = WeatherFacade.weather_info('boulder', 2)
      expect(weather_info).to eq(expected)
  end

  it 'can create a weather instance', :vcr do
    weather = WeatherFacade.create_weather('boulder', 3)
    expect(weather).to be_an_instance_of(Weather)
  end
end
