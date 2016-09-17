class Item < ApplicationRecord
    
  validates :name,  presence: true

  has_many :monster_drops
  has_many :monsters, through: :monster_drops
  
  has_attached_file :avatar, 
  styles: {
    thumb: '300x300>',
    square: '400x400#',
    medium: '300x300>'
  },
 :path => "/images/:class/:attachment/:id_partition/:attachment_:id_:hash_:style.:extension",
 :url => "https://s3-us-west-1.amazonaws.com/baramlegacy/images/items/:id.:extension"
                             
  # Validate the attached image is image/jpg, image/png, etc
  #validates_attachment :avatar,
  #content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
    
  def picture_from_url(url)
    self.avatar = URI.parse(url)
  end
    
  def image_url
    "https://s3-us-west-1.amazonaws.com/baramlegacy/images/Items/#{id}.png"
  end
end
