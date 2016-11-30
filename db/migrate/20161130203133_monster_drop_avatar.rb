class MonsterDropAvatar < ActiveRecord::Migration[5.0]
  def change
    remove_column :monsters, :avatar_file_name 
    remove_column :monsters, :avatar_file_size 
    remove_column :monsters, :avatar_updated_at
    add_column :monsters, :image_id, :int 
    add_column :monsters, :aggro_type, :int
    
  end
end
