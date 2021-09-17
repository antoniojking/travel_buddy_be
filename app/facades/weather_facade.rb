class WeatherFacade
  def self.weather_info(query, num_of_days)
    json = WeatherService.get_destination_weather(query, num_of_days)
    {
      id: json[:id],
      description: json[:weather][0][:description],
      current: json[:main][:temp],
      min_temp: json[:main][:temp_min],
      max_temp: json[:main][:temp_max]
    }
  end

  def self.create_weather(query, num_of_days)
    Weather.new(weather_info(city))
  end
end
