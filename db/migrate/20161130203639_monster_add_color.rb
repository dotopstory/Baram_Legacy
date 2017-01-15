class MonsterAddColor < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :color, :int
  end
  execute "ALTER TABLE monsters DROP PRIMARY KEY"
  
end
