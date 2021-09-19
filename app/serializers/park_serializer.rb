class ParkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :description,
             :activities,
             :contacts,
             :directions,
             :operating_hours,
             :images
end