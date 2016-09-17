class CreateMonsterDrops < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_drops do |t|
      t.integer :monster_id
      t.integer :item_id

      t.timestamps
    end
    add_index :monster_drops, :monster_id
    add_index :monster_drops, :item_id
    add_index :monster_drops, [:monster_id, :item_id], unique: true
  end
end
