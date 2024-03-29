class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @visibility_status = @recipe.public? ? 'Public' : 'Private'
    @ingredients = @recipe.ingredients
  end

  def new
    @user = current_user
    @recipe = @user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to user_recipes_path(current_user)
    else
      render :new, notice: 'Recipe could not be created successfully'
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy

    redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully deleted'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
