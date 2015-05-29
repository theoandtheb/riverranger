class AddRegtypeToOgrgeojsons < ActiveRecord::Migration
  def change
  	add_column :ogrgeojsons, :regtype, :integer
  end
end
