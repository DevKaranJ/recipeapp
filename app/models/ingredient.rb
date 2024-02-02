class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :food_name, presence: true
  validates :quantity, presence: true
end
