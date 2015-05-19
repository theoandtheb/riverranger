class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :description
      t.text :comment
      t.st_point :coordinates, srid: 4326
      t.references :user, index: true
      t.string :loc_nic
      t.datetime :observe_on
      t.timestamps null: false
    end
    add_foreign_key :observations, :users, dependent: :delete
  end
end
