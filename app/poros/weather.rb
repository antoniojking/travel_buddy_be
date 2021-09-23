class Weather
  attr_reader :id, :current_temp, :min_temp, :max_temp, :current_conditions

  def initialize(info)
    @id = info[:weather][0][:id]
    @current_temp = kelvin_to_farhenhiet(info[:main][:temp])
    @min_temp = kelvin_to_farhenhiet(info[:main][:temp_min])
    @max_temp = kelvin_to_farhenhiet(info[:main][:temp_max])
    @current_conditions = info[:weather][0][:description]
  end

  def kelvin_to_farhenhiet(k)
    ((k - 273.15) * 9 / 5 + 32).round(2)
    # ( 9 / 5 ( k - 273 ) + 32 ).round(2)
  end
end
