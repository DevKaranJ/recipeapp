class AddFoodNameToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :food_name, :string
  end
end
