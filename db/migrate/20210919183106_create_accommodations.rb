class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.references :trip, foreign_key: true
      t.string :name
      t.string :location
      t.string :details

      t.timestamps
    end
  end
end
