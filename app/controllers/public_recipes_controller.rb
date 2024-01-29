# app/controllers/public_recipes_controller.rb
class PublicRecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @recipe_info = {}
    @public_recipes.each do |recipe|
      total_food_items = recipe.foods.count
      total_price = recipe.foods.sum(&:price)
      user_name = recipe.user.name
      @recipe_info[recipe.name] = { total_food_items: total_food_items, total_price: total_price, user_name: user_name }
    end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to public_recipes_path, notice: "Recipe deleted successfully."
    else
      redirect_to public_recipes_path, alert: "You are not authorized to delete this recipe."
    end
  end

  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
