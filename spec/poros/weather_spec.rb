require 'rails_helper'

RSpec.describe Weather do
  it 'exists and has attributes' do
    attributes = {weather: [
      {
        id: 800,
        main: "Clear",
        description: "clear sky",
        icon: "01d"}],
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

          weather = Weather.new(attributes)

          #

          expect(weather).to be_an_instance_of(Weather)
          expect(weather.id).to eq(attributes[:weather][0][:id])
          expect(weather.current_temp).to eq(63.72)
          expect(weather.min_temp).to eq(61.81)
          expect(weather.max_temp).to eq(65.61)
          expect(weather.current_conditions).to eq(attributes[:weather][0][:description])
        end
      end
