require 'rails_helper'

RSpec.describe WeatherService do
  it 'can make a connection to external service' do
    connection = WeatherService.conn('https://api.openweathermap.org/data/2.5/weather')
    expect(connection).to be_an_instance_of(Faraday::Connection)
  end

  it 'can get weather for a given destination', :vcr do
    json = WeatherService.get_destination_weather('37.5858662', '-85.67330523')

    expect(json).to have_key(:weather)
    expect(json[:weather][0]).to have_key(:description)
    expect(json[:main]).to have_key(:temp)
    expect(json[:main]).to have_key(:temp_min)
    expect(json[:main]).to have_key(:temp_max)
  end
end
