class WeatherService < BaseService
  def self.get_destination_weather(query, num_of_days)
    response = conn('http://api.weatherapi.com/v1/forecast.json').get do |f|
      f.params['key'] = ENV['weather_key']
      f.params['q'] = query
      f.params['days'] = num_of_days
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
