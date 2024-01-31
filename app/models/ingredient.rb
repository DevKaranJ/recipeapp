class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :quantity, presence: true
  attribute :food_name, :string
end
