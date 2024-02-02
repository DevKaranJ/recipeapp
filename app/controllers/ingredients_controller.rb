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
  
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])

    if @ingredient.update(ingredient_params)
      redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.find(params[:id])
    @ingredient.destroy

    redirect_to user_recipe_path(@recipe.user, @recipe), notice: 'Ingredient removed successfully.'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:food_name, :quantity, :value_in_dollars)
  end
end
