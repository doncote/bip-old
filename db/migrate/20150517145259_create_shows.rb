class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|

      t.references :venue, nil: false
      t.datetime :date
      t.string :slug

      t.timestamps null: false
    end

    add_index :shows, :slug
  end
end
