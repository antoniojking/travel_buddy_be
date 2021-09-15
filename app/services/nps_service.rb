class NpsService < BaseService
  def self.get_nps_by_state(state)
    response = conn('https://developer.nps.gov/api/v1/parks').get do |f|
      f.params['api_key'] = ENV['nps_key']
      f.params['statecode'] = state
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
