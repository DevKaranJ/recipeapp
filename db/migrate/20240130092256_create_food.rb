class CreateFood < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.decimal :quantity
      t.references :user, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
