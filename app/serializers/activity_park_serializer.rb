class ActivityParkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :states
end
