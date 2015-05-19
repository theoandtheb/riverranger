class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :description
      t.text :comment
      t.st_point :coordinates, srid: 4326

      t.timestamps null: false
    end
  end
end
