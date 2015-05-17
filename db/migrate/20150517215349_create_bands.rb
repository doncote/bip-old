class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|

      t.string :name, nil: false
      t.string :slug, nil: false
      t.integer :legacy_id

      t.timestamps null: false
    end

    add_index :bands, :slug
  end
end
