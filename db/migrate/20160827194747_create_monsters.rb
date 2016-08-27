class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :string
      t.string :exp
      t.string :integer

      t.timestamps
    end
  end
end
