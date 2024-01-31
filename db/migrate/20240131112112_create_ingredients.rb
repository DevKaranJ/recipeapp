class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:ingredients)
      create_table :ingredients do |t|
        t.string :name
        t.string :quantity
        t.references :recipe, null: false, foreign_key: true

        t.timestamps
      end
    end
  end
end
