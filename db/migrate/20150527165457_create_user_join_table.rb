class CreateUserJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :ogrgeojsons do |t|
      # t.index [:user_id, :ogrgeojson_id]
      t.index [:ogrgeojson_id, :user_id], unique: true
    end
  end
end
