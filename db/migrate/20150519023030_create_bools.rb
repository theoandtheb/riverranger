class CreateBools < ActiveRecord::Migration
  def change
    create_table :bools do |t|
      t.boolean :mammal
      t.boolean :reptile
      t.boolean :amphibian
      t.boolean :fish
      t.boolean :plant
      t.boolean :insect
      t.boolean :bird
      t.boolean :species_at_risk
      t.boolean :wildlife_death
      t.boolean :shoreline_alterations
      t.boolean :water_quality
      t.boolean	:trash
      t.boolean	:foam
      t.boolean :red_blooms
      t.boolean :phragmites
      t.boolean :loosestrife
      t.boolean :dog_strangling_vine
      t.boolean :introduced_honeysuckle
      t.boolean :zebra_mussels
      t.boolean :giant_hogweed
      t.boolean :other_invasive
      t.references :observation, index: true

      t.timestamps null: false
    end
    add_foreign_key :bools, :observations, dependent: :delete
  end
end
