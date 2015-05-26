class ChangeOgrgeojsons < ActiveRecord::Migration
	self.up do
		change_table :ogrgeojsons do |t|
          t.references :observations, index: true
  		end
	    add_foreign_key :ogrgeojsons, :observations, dependent: :delete
	end
end
