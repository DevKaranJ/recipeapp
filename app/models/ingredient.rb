class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :food_name, presence: true
  validates :quantity, presence: true
end
