class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :first_name, :last_name, :authorization_token, :refresh_token

  attribute :trips do |object|
    object.trips
  end

  attribute :friends do |object|
    object.friends
  end
end
