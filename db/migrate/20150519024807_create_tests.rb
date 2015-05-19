class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
		t.integer :ph
		t.integer :temperature
		t.integer :phosphate
		t.integer :clarity
		t.integer :oxygen
		t.integer :nitri
		t.integer :nitrate
		t.integer :ecoli
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :tests, :observations, dependent: :delete
  end
end
