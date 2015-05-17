class AddBandIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :band_id, :integer, nil: false
    add_index :shows, :band_id
  end
end
