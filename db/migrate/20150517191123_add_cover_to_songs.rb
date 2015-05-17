class AddCoverToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :cover, :boolean, default: false
    add_index :songs, :cover
  end
end
