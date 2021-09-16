class CreateChecklistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, foreign_key: true
      t.references :user
      t.string :name

      t.timestamps
    end
  end
end
