class ChangeOgrgeojsons < ActiveRecord::Migration
	def change
		change_table :ogrgeojsons do |t|
          t.references :observations, index: true
  		end
	    add_foreign_key :ogrgeojsons, :observations, dependent: :delete
	end
end
