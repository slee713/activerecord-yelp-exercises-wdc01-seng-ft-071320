require 'faker'
Restaurant.destroy_all
Dish.destroy_all
Tag.destroy_all
DishTag.destroy_all

tag_names = ["Spicy", "Sweet", "Vegetarian", "Vegan", "Meat Lover",
"Gluten Free", "Saucy", "Salt-free", "Extra Cheesy", "All Natural", "Steak",
"Halal", "Kosher"]

rest_names = ["McDonalds", "Burger King", "Outback Steakhouse", "Red Robbins",
"Tropical Smoothie", "Five Guys", "Chipotle", "Pot Belly", "Mike's American Grill",
"Wendy's", "Taco Bamba", "Oh George's", "Pho 75", "Taco Bell", "Chic Fil A", "Jersey's Mike",
"Sweetwater", "Chicken & Beer", "Choongman Chicken", "Dominos"]

rest_names.each {|name| Restaurant.create(name: name)}

Restaurant.all.each { |restaurant| 10.times {Dish.create(name: Faker::Food.dish, restaurant_id: restaurant.id)}}

tag_names.each{|tag_name| Tag.create(name: tag_name)}

tag_ids = Tag.all.map{|tag| tag.id}

Dish.all.each {|dish| 3.times{DishTag.create(dish_id: dish.id, tag_id: tag_ids.sample)}}
