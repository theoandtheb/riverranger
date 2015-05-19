class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.text :title
      t.text :author
      t.text :abstract
      t.datetime :published
      t.string :url
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :studies, :observations, dependent: :delete
  end
end
