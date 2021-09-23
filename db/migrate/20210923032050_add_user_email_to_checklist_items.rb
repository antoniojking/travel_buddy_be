class AddUserEmailToChecklistItems < ActiveRecord::Migration[5.2]
  def change
    add_column :checklist_items, :user_email, :string
  end
end
