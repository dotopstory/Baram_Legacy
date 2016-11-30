require 'rubygems'
require 'roo'
  
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
    
  def name_to_id(search_name)
    item.find_by name: search_name
  end
  
  def image_url
    "https://s3-us-west-1.amazonaws.com/baramlegacy/images/Items/#{image_id}.png"
  end
   
  def self.open_spreadsheet(file)
    case File.extname(file)
    when ".csv" then Roo::Csv.new(file, nil, :ignore)
    when ".xls" then Roo::Excel.new(file, nil, :ignore)
     when ".xlsx" then Roo::Excelx.new(file, packed: nil, file_warning: :ignore)
    else raise "Unknown file type: #{file}"
    end
  end
  
  def self.import(file)
    allowed_attributes = ["id","image_id","name"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      item = find_by_id(row["id"]) || new
      item.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      item.save!
    end
  end
 
  
end
