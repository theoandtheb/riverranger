class CreateOgrgeojsonJoinTable < ActiveRecord::Migration
  def change
    create_join_table :ogrgeojsons, :observations do |t|
      # t.index [:ogrgeojson_id, :observation_id]
      t.index [:observation_id, :ogrgeojson_id], unique: true, name: 'observations_ogrgeojson_join_index'
    end
  end
end
