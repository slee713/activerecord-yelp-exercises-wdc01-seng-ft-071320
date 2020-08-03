require 'faker'
Restaurant.destroy_all
Dish.destroy_all
Tag.destroy_all
DishTag.destroy_all

tag_names = ["Spicy", "Sweet", "Vegitarian", "Vegan", "Meat Lover",
"Gluten Free", "Saucy", "Salt-free", "Extra Cheesy", "All Natural", "Steak",
"Halal", "Kosher"]

20.times {Restaurant.create(name: Faker::Restaurant.name)  }

Restaurant.all.each { |restaurant| 10.times {Dish.create(name: Faker::Food.dish, restaurant_id: restaurant.id)}}

tag_names.each{|tag_name| Tag.create(name: tag_name)}

tag_ids = Tag.all.map{|tag| tag.id}

Dish.all.each {|dish| 3.times{DishTag.create(dish_id: dish.id, tag_id: tag_ids.sample)}}
