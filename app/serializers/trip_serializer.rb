class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_date, :end_date, :park_code, :park_name

  attributes :checklists do |object|
    object.checklists
  end

  attributes :users do |object|
    object.users
  end
end
