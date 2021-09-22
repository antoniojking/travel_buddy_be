class ParkFacade
  def self.create_parks_by_state(state)
    json = NpsService.get_nps_by_state(state)
    json[:data].map do |detail|
      Park.new(detail)
    end
  end

  def self.create_parks_by_activity(activity)
    json = NpsService.get_nps_by_activity(activity)
    if !json[:data].empty?
      json[:data][0][:parks].map do |detail|
        Park.new(detail)
      end
    else
      nil
    end
  end

  def self.create_parks_by_park_code(park_code)
    json = NpsService.get_nps_by_parkcode(park_code)
    json[:data].map do |detail|
      Park.new(detail)
    end
  end
end
