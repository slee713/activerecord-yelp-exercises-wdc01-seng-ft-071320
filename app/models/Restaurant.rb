class Restaurant < ActiveRecord::Base
    has_many :dishes


    def self.mcdonalds
        Restaurant.find_by( name: "McDonalds")
    
    end

    
    def self.tenth 
        Restaurant.limit(10).last
    end

    def self.with_long_names
        
    end

    def self.update_dish_count
        Restaurant.all.each {|rest| rest.update_column(:dish_count, rest.dishes.count)}
    end

    def self.max_dishes
        Restaurant.update_dish_count
        Restaurant.order(:dish_count).first
    end

    def self.focused
        Restaurant.update_dish_count
        Restaurant.where("dish_count > 5")
    end


   




end