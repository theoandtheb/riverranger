class AddObserveOnToBools < ActiveRecord::Migration
  def change
    add_column :bools, :observe_on, :datetime, :default => "2015-05-01 00:00:00"
  end
end
