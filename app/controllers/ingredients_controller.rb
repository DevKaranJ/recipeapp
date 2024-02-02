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
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient added successfully.'
    else
      Rails.logger.debug @ingredient.errors.full_messages # Log errors to the console
      render :new
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:food_name, :quantity, :value_in_dollars)
  end
end
