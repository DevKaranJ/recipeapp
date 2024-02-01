# app/controllers/public_recipes_controller.rb
class PublicRecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to public_recipes_path, notice: 'Recipe deleted successfully.'
    else
      redirect_to public_recipes_path, alert: 'You are not authorized to delete this recipe.'
    end
  end
end
