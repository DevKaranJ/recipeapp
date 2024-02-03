class AddRecipeIdToFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :foods, :recipe, foreign_key: true, null: true
  end
end
