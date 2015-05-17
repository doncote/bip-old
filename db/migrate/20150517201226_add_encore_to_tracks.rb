class AddEncoreToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :encore, :integer
  end
end
