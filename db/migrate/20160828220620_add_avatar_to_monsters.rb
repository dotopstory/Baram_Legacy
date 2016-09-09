class AddAvatarToMonsters < ActiveRecord::Migration[5.0]
  
  def self.up
    add_attachment :monsters, :avatar
  end

  def self.down
    remove_attachment :monsters, :avatar
  end

end
