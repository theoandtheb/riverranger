class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :documents, :observations, dependent: :delete
  end
end
