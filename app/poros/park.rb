class Park
  attr_reader :name,
              :id,
              :description,
              :activities,
              :contacts,
              :directions,
              :operating_hours,
              :images,
              :state

  def initialize(park_info)
    @name = park_info[:fullName]
    @id = park_info[:parkCode]
    @description = park_info[:description]
    @activities = park_info[:activities]
    @contacts = park_info[:contacts]
    @directions = park_info[:directionsInfo]
    @operating_hours = park_info[:operatingHours]
    @images = park_info[:images]
    @states = check_state_values(park_info[:states])
  end

  def check_state_values(state)
    if state.length > 2
      return state.split(',')
    else
      return [state]
    end
  end
end
