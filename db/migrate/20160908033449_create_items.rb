class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.string :description
      t.integer :durability
      t.string :damage_small
      t.string :damage_large
      t.integer :armor
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :regen
      t.integer :spellshield
      t.integer :accuracy
      t.integer :critical
      t.integer :hp 
      t.integer :mp
      t.integer :level_required
      t.string :job_required
      t.boolean :repairable
      t.boolean :drops_on_death
      t.boolean :breaks_on_death

      t.timestamps
    end
  end
  
end
