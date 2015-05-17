class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :author
      t.string :title, nil: false
      t.string :slug, nil: false
      t.timestamps null: false
    end

    add_index :songs, :slug
    add_index :songs, :author_id
  end
end
