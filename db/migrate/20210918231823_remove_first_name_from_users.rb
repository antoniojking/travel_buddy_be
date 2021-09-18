class RemoveFirstNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    rename_column :users, :authorization_token, :token
  end
end
