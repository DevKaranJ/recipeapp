require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
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
    visit user_recipe_path(@user, @recipe)
  end

  it 'should display the name of the recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'should display the preparation time of the recipe' do
    expect(page).to have_content(@recipe.preparation_time)
  end


  it 'should display the cooking time of the recipe' do
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'should display the description of the recipe' do
    expect(page).to have_content(@recipe.description)
  end
end


