class AddObserveOnToTests < ActiveRecord::Migration
  def change
    add_column :tests, :observe_on, :datetime, :default => "2015-05-01 00:00:00"
  end
end
