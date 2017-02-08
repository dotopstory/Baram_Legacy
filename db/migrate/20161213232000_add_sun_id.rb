class AddSunId < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :sun_id, :int
  end
end
