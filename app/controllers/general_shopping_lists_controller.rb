# app/controllers/general_shopping_lists_controller.rb
class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @missing_foods = calculate_missing_foods(@user)
    @total_items = @missing_foods.sum { |_food_name, missing_quantity| missing_quantity }
    @total_price = calculate_total_price(@missing_foods)
  end

  private

  def calculate_missing_foods(user)
    missing_foods = {}

    ingredients = Ingredient.includes(:food).joins(:recipe).where(recipes: { user_id: user.id }).group_by do |ingredient|
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

  def calculate_total_price(missing_foods)
    total_price = 0
    missing_foods.each do |food_name, missing_quantity|
      food = Food.find_by(name: food_name)
      total_price += food.price * missing_quantity if food
    end
    total_price
  end
end
