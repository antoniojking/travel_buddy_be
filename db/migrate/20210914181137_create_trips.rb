class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :park_id
      t.string :name, default: 'New Trip'
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
