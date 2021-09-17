require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can create weather info' do
    VCR.use_cassette('weather') do
      expected = {}

      weather_info = WeatherFacade.weather_info('boulder', 1)
      expect(weather_info).to eq(expected)
    end
  end

  it 'can create a weather instance' do
    VCR.use_cassette('weather') do
    weather = WeatherFacade.create_weather('boulder', 3)
    expect(weather).to be_an_instance_of(Weather)
    end
  end
end
