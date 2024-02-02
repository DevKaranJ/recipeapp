class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
    @missing_foods = calculate_missing_foods(@user, @recipes)
    @total_items = @missing_foods.sum { |_food_name, missing_quantity| missing_quantity }

    # Calculate total price, handling nil case gracefully
    @total_price = @missing_foods.sum do |food_name, missing_quantity|
      food = Food.find_by(name: food_name)
      food ? missing_quantity * food.price : 0
    end
  end

  private

  def calculate_missing_foods(user, recipes)
    missing_foods = {}
    ingredients = Ingredient.includes(:food).where(recipe_id: recipes.pluck(:id)).group_by do |ingredient|
      ingredient.food&.name
    end

    ingredients.each do |food_name, ingredients|
      total_quantity_required = ingredients.sum { |ingredient| ingredient.quantity.to_i }
      user_food = user.foods.find_by(name: food_name)
      missing_quantity = user_food ? [total_quantity_required - user_food.quantity, 0].max : total_quantity_required
      missing_foods[food_name] = missing_quantity
    end

    missing_foods
  end
end
