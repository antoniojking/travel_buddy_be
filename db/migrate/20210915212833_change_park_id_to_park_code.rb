class ChangeParkIdToParkCode < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :park_id, :park_code
  end
end
