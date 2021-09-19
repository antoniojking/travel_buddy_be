class ChecklistItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_id

  attribute :user_email do |object|
    object.user.email
  end
end
