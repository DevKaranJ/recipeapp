class AddValueInDollarsToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :value_in_dollars, :decimal
  end
end
