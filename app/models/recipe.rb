class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :ingredients
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, inclusion: { in: [true, false] }

  belongs_to :user
end
