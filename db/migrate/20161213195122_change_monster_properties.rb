class ChangeMonsterProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :monsters, :avatar_content_type, :string
    add_index :monsters, ["id", "name"], :unique => true
  end

end
