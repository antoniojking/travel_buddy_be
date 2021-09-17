class ParkFacade
  def self.create_parks_by_state(state)
    json = NpsService.get_nps_by_state(state)
    json[:data].map do |detail|
      Park.new(detail)
    end
  end
end