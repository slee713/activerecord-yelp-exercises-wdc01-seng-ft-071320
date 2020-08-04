class Dish < ActiveRecord::Base
belongs_to :restaurant
has_many :dish_tags
has_many :tags, through: :dish_tags


# * `Dish.names` - all the names of dishes
# * `Dish.max_tags` - single dish with the most tags
# * `Dish.untagged` - dishes with no tags
# * `Dish.average_tag_count` - average tag count for dishes
# * `Dish#tag_count` - number of tags for a dish
# * `Dish#tag_names` - names of the tags on a dish
# * `Dish#most_popular_tag` - most widely used tag for a dish
    def self.names
        pluck(:name)
    end


    def self.max_tags
       joins(:dish_tags).order('COUNT(tag_id) DESC').group(:dish_id).first
    end

    def self.untagged
        # joins(:dish_tags).having('COUNT(tag_id) = 0').group(:dish_id)
    end

    def self.average_tag_count
        tags.group(:dish_id)
    end

    def tag_names
        tags.pluck(:name)
    end

    









end