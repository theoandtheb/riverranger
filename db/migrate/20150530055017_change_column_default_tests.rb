class ChangeColumnDefaultTests < ActiveRecord::Migration
  def change
  	change_column_default(:tests, :observe_on, Time.now)
  end
end
