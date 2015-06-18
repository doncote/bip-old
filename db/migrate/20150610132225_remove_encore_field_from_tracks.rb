class RemoveEncoreFieldFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :encore, :integer
  end
end
