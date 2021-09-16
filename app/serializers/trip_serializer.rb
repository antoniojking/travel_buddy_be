class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_date, :end_date, :park_code
end
