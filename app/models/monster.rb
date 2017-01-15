require 'rubygems'
require 'roo'

class Monster < ApplicationRecord
    
  #self.primary_keys = :id, :name
  
  validates :name,  presence: true
  has_many :monster_drops
  has_many :items, through: :monster_drops
  
    
  def drop_item(item_id)
      monster_drops.create(item_id: item_id)
  end 
  
  def get_drop_items
        dropped_items = "SELECT item_id FROM monster_drops
                     WHERE  monster_id = :id"
        Item.where("id IN (#{dropped_items})", id: id)
  end 
  
  
  def remove_drop_item(item)
    monster_drops.find_by(item_id: item.id).destroy 
  end 
  
  def drops?(item)
    monster_drops.include?(item) 
  end   
  
  def image_url
    "https://s3-us-west-1.amazonaws.com/baramlegacy/images/Monsters/#{image_id}.png"
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
    allowed_attributes = ["sun_id","name","exp","description", "image_id", "color"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    #drop_id = 1
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      monster = new
      monster.id = i - 1
      monster.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k } 
      unless row['item_drops'].nil? 
        row['item_drops'].split(",").map(&:strip).each do |item_name|
          puts item_name
          item_to_drop = Item.find_by(name: item_name) 
          unless item_to_drop.nil? 
              MonsterDrop.create(monster_id: monster.id, item_id: item_to_drop.id )
          end
      end
      monster.save!
      end
    end
  end
  
  
end
