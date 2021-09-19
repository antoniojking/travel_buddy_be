class ChecklistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :category, :trip_id

  attributes :item_count do |object|
    object.checklist_items.count
  end

  attributes :items do |object|
    object.checklist_items
  end
end
