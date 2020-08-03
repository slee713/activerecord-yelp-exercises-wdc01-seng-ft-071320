class AddDishCountToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :dish_count, :integer
  end
end
