class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.references :trip, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
