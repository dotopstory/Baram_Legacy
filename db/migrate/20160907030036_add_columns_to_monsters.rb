class AddColumnsToMonsters < ActiveRecord::Migration[5.0]
  def change
        add_column :monsters, :hp, :decimal
        add_column :monsters, :mp, :decimal
        add_column :monsters, :attack_damage, :decimal
  end
end
