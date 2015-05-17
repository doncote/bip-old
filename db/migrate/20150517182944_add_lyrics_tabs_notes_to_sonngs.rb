class AddLyricsTabsNotesToSonngs < ActiveRecord::Migration
  def change
    add_column :songs, :lyrics, :text
    add_column :songs, :tabs, :text
    add_column :songs, :notes, :text
    add_column :songs, :legacy_abbr, :string
    add_column :songs, :legacy_id, :integer
  end
end
