class Weather
  attr_reader :id, :current_temp, :current_conditions, :forecast

  def initialize(info)
    @id = info[:id]
    @current_temp = info[:current_temp]
    @current_conditions = info[:current_conditions]
    @forecast = info[:forecast]
  end
end
