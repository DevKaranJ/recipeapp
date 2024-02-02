require 'rails_helper'

RSpec.describe 'Recipe Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User1', email: 'user1@example.com', password: 'password123' )
    sign_in @user
    @recipe = Recipe.create(
      name: 'Beef BBQ',
      preparation_time: 5,
      cooking_time: 10,
      description: 'Season well with spices of your choice and put in smoke grill',
      public: true,
      user_id: @user.id
    )
    5.times do |i|
      Recipe.create(
        name: 'Beef BBQ',
        preparation_time: 5,
        cooking_time: 10,
        description: 'Season well with spices of your choice and put in smoke grill',
        public: true,
        user_id: @user.id)
    end
    visit user_recipes_path(@user)
  end

  it 'display the name of each recipe' do
    @user.recipes.each do
      expect(page).to have_content(@recipe.name) 
    end
  end

  it 'display recipes description' do
    expect(page).to have_content(@recipe.description)
  end

  it 'display the button to add new recipe' do
    expect(page).to have_link('New Recipe', href: new_user_recipe_path(@user))
  end

  it 'is linked to new page when button new recipe is clicked' do
    click_link('New Recipe',href: new_user_recipe_path(@user))
    expect(page).to have_current_path(new_user_recipe_path(@user))
  end
end