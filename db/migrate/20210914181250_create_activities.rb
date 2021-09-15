class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :trip, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
