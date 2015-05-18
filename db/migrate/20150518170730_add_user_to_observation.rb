class AddUserToObservation < ActiveRecord::Migration
  def change
  	add_reference :observations, :user, index: true
  	add_foreign_key :observations, :users
  end
end
