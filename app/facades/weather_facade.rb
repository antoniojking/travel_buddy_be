class WeatherFacade
  # def self.weather_info(query, num_of_days)
  #   json = WeatherService.get_destination_weather(query, num_of_days)
  #   {
  #     id: json[:location][:name],
  #     current_temp: json[:current][:temp_f],
  #     current_conditions: json[:current][:condition][:text],
  #     forecast:
  #     json[:forecast][:forecastday].map do |day|
  #       [
  #         date: day[:date],
  #         min_temp: day[:day][:mintemp_f],
  #         max_temp: day[:day][:maxtemp_f],
  #         condition: day[:day][:condition][:text]
  #       ]
  #     end.flatten
  #   }
  # end

  def self.create_weather(lat, lon)
    json = WeatherService.get_destination_weather(lat, lon)
    Weather.new(json)
  end
end
