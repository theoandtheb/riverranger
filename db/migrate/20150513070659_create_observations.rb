class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :description
      t.text :comment
      t.point :coordinates, geographic: true

      t.timestamps null: false
    end
  end
end
