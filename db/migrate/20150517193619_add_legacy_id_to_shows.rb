class AddLegacyIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :legacy_id, :integer
  end
end
