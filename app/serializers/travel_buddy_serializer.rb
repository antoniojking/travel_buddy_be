class TravelBuddySerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :trip_id
end
