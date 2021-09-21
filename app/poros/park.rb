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
    @state = park_info[:states]
  end
end
