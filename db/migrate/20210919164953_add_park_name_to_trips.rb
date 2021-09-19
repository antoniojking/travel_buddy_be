class AddParkNameToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :park_name, :string
  end
end
