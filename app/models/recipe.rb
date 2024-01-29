class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
  validates :public, inclusion: { in: [true, false] }
end
