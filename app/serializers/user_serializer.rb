class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :spotify_id, :token, :refresh_token

  attribute :current_trips do |object|
    object.trips.current_trips
  end

  attribute :upcoming_trips do |object|
    object.trips.upcoming_trips
  end

  attribute :past_trips do |object|
    object.trips.past_trips
  end

  attribute :friends do |object|
    object.friends
  end

  def self.format_user_email(users)
    {"data":
      users.map do |user|
        {
          "id": user.id,
          "type": "User Email",
          "attributes": {
            "email": user.email
          }
        }
      end
    }
  end
end
