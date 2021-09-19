class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_temp, :forecast, :current_conditions
end
