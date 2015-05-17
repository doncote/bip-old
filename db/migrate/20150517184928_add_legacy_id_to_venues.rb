class AddLegacyIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :legacy_id, :integer
  end
end
