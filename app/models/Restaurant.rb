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


    def self.max_dishes
        Restaurant.update_dish_count
        Restaurant.order(dishes.count).first
    end

    def self.focused
        Restaurant.update_dish_count
        Restaurant.where("dish_count < 5")
    end

    def self.large_menu
        Restaurant.update_dish_count
        Restaurant.where("dish_count > 20")
    end

    def self.vegetarian
        # Restaurant.joins(:dish_tags).joins
    end

   




end