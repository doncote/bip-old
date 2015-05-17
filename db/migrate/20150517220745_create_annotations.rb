class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :track, nil: false
      t.text :desc, nil: false

      t.timestamps null: false
    end
  end
end
