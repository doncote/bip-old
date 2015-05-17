class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|

      t.references :show, nil: false
      t.references :song, nil: false
      t.integer :set, nil: false
      t.integer :position, nil: false
      t.boolean :segue, default: false
      t.timestamps null: false

    end
  end
end
