class CreateOgrgeojsons < ActiveRecord::Migration
  def change
    create_table :ogrgeojsons do |t|
      t.string :name
      t.st_polygon :wkb_geometry, srid: 4326
    end
  end
end
