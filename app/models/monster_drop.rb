class MonsterDrop < ApplicationRecord
  belongs_to :monster, class_name: "Monster"
  belongs_to :item, class_name: "Item"
  validates :monster_id, presence: true
  validates :item_id, presence: true
end
