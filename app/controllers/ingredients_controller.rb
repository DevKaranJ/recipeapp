class IngredientsController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.build(ingredient_params)
    if @ingredient.save
      redirect_to @recipe, notice: 'Ingredient added successfully.'
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:food_name, :quantity, :value_in_dollars)
  end
end
