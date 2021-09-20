class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_date, :end_date, :park_code, :park_name, :user_id

  attributes :checklists do |object|
    object.checklists
  end

  attributes :travel_buddies do |object|
    object.users
  end
end
