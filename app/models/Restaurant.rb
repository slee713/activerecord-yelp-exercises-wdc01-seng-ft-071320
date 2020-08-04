class Restaurant < ActiveRecord::Base
    has_many :dishes


    def self.mcdonalds
        Restaurant.find_by( name: "McDonalds")
    
    end

    
    def self.tenth 
        Restaurant.limit(10).last
    end

    def self.with_long_names
        where('LENGTH(name) > 12')
    end


    def self.max_dishes
        joins(:dishes).order('COUNT(dishes.id) DESC').group(:restaurant_id).first
    end

    def self.focused
        joins(:dishes).having('COUNT(dishes.id) < 5').group(:restaurant_id)
    end

    def self.large_menu
        joins(:dishes).having('COUNT(dishes.id) >9').group(:restaurant_id)
    end

    def self.vegetarian
        joins(:dishes).joins(:dish_tag)
    end

   




end