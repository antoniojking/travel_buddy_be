class ChangeNameToTrips < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trips, :name, 'New Trip'
  end
end
