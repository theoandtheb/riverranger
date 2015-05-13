class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :observations
  end
end
