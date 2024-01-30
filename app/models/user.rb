class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :recipes
         has_many :foods

         def calculate_missing_foods
           general_food_list = self.foods
           missing_foods = []

           Recipe.all.each do |recipe|
             recipe.foods.each do |food|
               if general_food_list.where(name: food.name).empty?
                 missing_foods << food
               end
             end
           end

           missing_foods
         end
end
