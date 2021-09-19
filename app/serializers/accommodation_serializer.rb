class AccommodationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location, :details
end
