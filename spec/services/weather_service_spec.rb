require 'rails_helper'

RSpec.describe WeatherService do
  it 'can make a connection to external service' do
    connection = WeatherService.conn('https://api.openweathermap.org/data/2.5/weather')
    expect(connection).to be_an_instance_of(Faraday::Connection)
  end

  it 'can get weather for a given destination', :vcr do
    json = WeatherService.get_destination_weather('Boulder', 3)

    expect(json).to have_key(:location)
    expect(json).to have_key(:current)
    expect(json[:current]).to have_key(:temp_f)
    expect(json[:current][:temp_f].class).to eq(Float)
    expect(json[:current]).to have_key(:condition)
    expect(json[:current][:condition]).to have_key(:text)
    expect(json[:current][:condition][:text].class).to eq(String)
    expect(json[:current][:condition]).to have_key(:icon)
    expect(json[:current][:condition][:icon].class).to eq(String)
    expect(json).to have_key(:forecast)
    expect(json[:forecast].class).to eq(Hash)
    expect(json[:forecast][:forecastday].count).to eq(3)
  end
end
