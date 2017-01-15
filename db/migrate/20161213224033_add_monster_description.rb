class AddMonsterDescription < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :description, :string 
    
  end
end
