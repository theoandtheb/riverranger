class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
		t.decimal :ph, precision: 3, scale: 1
		t.decimal :temperature, precision: 3, scale: 1
		t.decimal :phosphate, precision: 3, scale: 1
		t.decimal :clarity, precision: 5, scale: 2
		t.decimal :oxygen, precision: 4, scale: 1
		t.decimal :nitri, precision: 3, scale: 1
		t.integer :nitrate
		t.integer :ecoli
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :tests, :observations, dependent: :delete
  end
end
