class CreateTravelBuddies < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_buddies do |t|
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
