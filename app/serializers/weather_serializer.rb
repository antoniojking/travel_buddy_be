class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_temp, :min_temp, :max_temp, :current_conditions
end
