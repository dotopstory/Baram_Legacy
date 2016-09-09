class Monster < ApplicationRecord
    
  validates :name,  presence: true
  validates :exp,   presence: true
  
  has_attached_file :avatar, 
  styles: {
    thumb: '300x300>',
    square: '400x400#',
    medium: '300x300>'
  },
 :path => "/images/:class/:attachment/:id_partition/:attachment_:id_:hash_:style.:extension",
 :url => "https://s3-us-west-1.amazonaws.com/baramlegacy/images/:id.:extension"
                             
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment :avatar,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] }
    
end
