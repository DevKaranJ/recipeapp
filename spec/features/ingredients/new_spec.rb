require 'rails_helper'

RSpec.describe 'Ingredients New Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(
      name: 'Beef BBQ',
      preparation_time: 5,
      cooking_time: 10,
      description: 'Season well with spices of your choice and put in smoke grill',
      public: true,
      user_id: @user.id
    )
    @ingredient = Ingredient.create(
      food_name: 'Apples',
      quantity: 10,
      value_in_dollars: 20
    )
  end


  it 'Display form to create new ingredients' do
    visit new_user_recipe_ingredient_path(@user, @recipe)

    expect(page).to have_content('Add Ingredient')
    expect(page).to have_field('ingredient_food_name')
    expect(page).to have_field('ingredient_quantity')
    expect(page).to have_field('ingredient_value_in_dollars')
    expect(page).to have_button('Add Ingredient')
  end
end
