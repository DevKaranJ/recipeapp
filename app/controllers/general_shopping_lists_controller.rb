# app/controllers/general_shopping_lists_controller.rb

class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @missing_foods = current_user.calculate_missing_foods
    @total_items = @missing_foods.sum(:quantity)
    @total_price = @missing_foods.sum(:price)
  end
end
