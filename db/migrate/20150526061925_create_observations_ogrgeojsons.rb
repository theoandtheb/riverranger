class CreateObservationsOgrgeojsons < ActiveRecord::Migration
  def change
    create_table :observations_ogrgeojsons, id: false do |t|
      t.belongs_to :observations, index: true
      t.belongs_to :ogrgeojsons, index: true
    end
  end
end
