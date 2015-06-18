class ChangeSetToStringInTracks < ActiveRecord::Migration
  def change
    change_column :tracks, :set, :string
  end
end
