class Weather
  attr_reader :current_temp, :current_conditions, :forecast

  def initialize(info)
    @current_temp = info[:current_temp]
    @current_conditions = info[:current_conditions]
    @forecast = info[:forecast]
  end
end
