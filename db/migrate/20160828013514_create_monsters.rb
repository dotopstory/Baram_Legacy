class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.integer :exp 

      t.timestamps
    end
  end
end
