class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :spotify_id, :token, :refresh_token

  attribute :trips do |object|
    object.trips
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
