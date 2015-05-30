class ChangeColumnDefaultTestsAgain < ActiveRecord::Migration
  def change 
  	change_column_default(:tests, :observe_on, nil)
  end
end
