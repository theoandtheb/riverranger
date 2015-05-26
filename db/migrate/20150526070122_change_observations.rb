class ChangeObservations < ActiveRecord::Migration
	def change
		change_table :observations do |t|
          t.references :ogrgeojsons, index: true
  		end
	    add_foreign_key :observations, :ogrgeojsons, dependent: :delete
	end
end
