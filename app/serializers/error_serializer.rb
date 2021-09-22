class ErrorSerializer
  def self.weather_params_not_included
    {
      "message": "location and days must be present",
      "status": "bad request"
    }
  end

  def self.weather_params_are_empty
    {
      "message": "location and days must not be blank",
      "status": "bad request"
    }
  end

  def self.park_params_blank_or_missing
    {
      "message": "state must not be blank",
      "status": "bad request"
    }
  end

  def self.park_params_id_blank_or_missing
    {
      "message": "id must present and not missing",
      "status": "bad request"
    }
  end

  def self.friendship_not_created
    {
      "message": "user does not exist",
      "status": "bad request"
    }
  end
end
