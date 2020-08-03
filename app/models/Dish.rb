class Dish < ActiveRecord::Base
belongs_to :restaurant
has_many :dish_tags
has_many :tags, through: :dish_tags

    def self.names
        Dish.pluck(:name)
    end

    

    def self.max_tags
       
    end







end