class MonsterAddColor < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :color, :int
  end
end
