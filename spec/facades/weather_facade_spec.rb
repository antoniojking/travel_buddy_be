require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can create a weather instance', :vcr do
      expected = {weather: [
        {
            id: 800,
            main: "Clear",
            description: "clear sky",
            icon: "01d"
        }],
        main: {
        temp: 290.77,
        feels_like: 290,
        temp_min: 289.71,
        temp_max: 291.82,
        pressure: 1017,
        humidity: 54,
        sea_level: 1017,
        grnd_level: 987
    }}

    weather_info = WeatherFacade.create_weather('37.5858662', '-85.67330523')
    expect(weather).to be_an_instance_of(Weather)
  end

  xit 'can create a weather instance', :vcr do
    weather = WeatherFacade.create_weather('boulder', 3)
    expect(weather).to be_an_instance_of(Weather)
  end
end
