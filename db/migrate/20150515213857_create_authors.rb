class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|

      t.string :name, nil: false
      t.string :slug, nil: false
      t.timestamps null: false
    end

    add_index :authors, :slug
  end
end
