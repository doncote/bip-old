class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|

      t.string :name, nil: false
      t.string :slug, nil: false
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end

    add_index :venues, :slug
  end
end
