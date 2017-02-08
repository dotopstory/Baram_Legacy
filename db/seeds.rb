require 'rubygems'
require 'roo'

unless User.find_by( email: "baram@baramlegacy.com" )
    User.create!(name: "baram", 
            email: "baram@baramlegacy.com" ,
            password: "123123" ,
            password_confirmation: "123123" ,
            admin: true, 
            activated: true,
            activated_at: Time.zone.now)
end


Monster.import("/app/assets/images/monsters/monsters.xlsx")

Item.import("/app/assets/images/monsters/items.xlsx")
 
            
