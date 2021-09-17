class WeatherFacade
  def self.weather_info(query, num_of_days)
    json = WeatherService.get_destination_weather(query, num_of_days)
    {
      id: json[:location][:name],
      current_temp: json[:current][:temp_f],
      forecast:
      json[:forecast][:forecastday].map do |day|
        [
          date: day[:date],
          min_temp: day[:day][:mintemp_f],
          max_temp: day[:day][:maxtemp_f],
          condition: day[:day][:condition][:text]
        ]
      end.flatten
    }
  end

  def self.create_weather(query, num_of_days)
    Weather.new(weather_info(query, num_of_days))
  end
end
