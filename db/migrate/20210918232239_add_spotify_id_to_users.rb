class AddSpotifyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :spotify_id, :string
  end
end
