class Monster < ApplicationRecord
    
  validates :name,  presence: true
  validates :exp,   presence: true
  has_many :monster_drops
  has_many :items, through: :monster_drops
  
  has_attached_file :avatar, 
  styles: {
    thumb: '300x300>',
    square: '400x400#',
    medium: '300x300>'
  },
 :path => "/images/:class/:attachment/:id_partition/:attachment_:id_:hash_:style.:extension",
 :url => "https://s3-us-west-1.amazonaws.com/baramlegacy/images/Monsters/:id.:extension"
                             
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
    
    
  def drop_item(item)
      monster_drops.create(item_id: item.id)
  end 
  
  def get_drop_items
        dropped_items = "SELECT item_id FROM monster_drops
                     WHERE  monster_id = :id"
        Item.where("id IN (#{dropped_items})
                     OR id = :id", id: id)
  end 
  
  
  def remove_drop_item(item)
    monster_drops.find_by(item_id: item.id).destroy 
  end 
  
  def drops?(item)
    monster_drops.include?(item) 
  end   
  
  def picture_from_url(url)
    self.avatar = URI.parse(url)
  end
end
