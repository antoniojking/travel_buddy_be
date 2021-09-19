class AccommodationsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location, :details
end
