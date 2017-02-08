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


Monster.import("https://s3-us-west-1.amazonaws.com/baramlegacy/images/Data/monsters.xlsx")

Item.import("https://s3-us-west-1.amazonaws.com/baramlegacy/images/Data/items.xlsx")
 
            
