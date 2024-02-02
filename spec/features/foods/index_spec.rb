require 'rails_helper'

RSpec.describe 'Testing Food#index view, it should', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, user_id: @user.id)
    5.times { |i| Food.create(name: "Food ##{i}", measurement_unit: 'unit', price: 1, user_id: @user.id) }
    visit user_foods_path(@user)
  end

  it 'display button to add new food' do
    expect(page).to have_link('Add Food', href: new_user_food_path(@user))
  end

  it 'navigate to a new page when the button to add food is clicked' do
    click_link('Add Food', href: new_user_food_path(@user))
    expect(page).to have_current_path(new_user_food_path(@user))
  end

  it 'display the name of each of the foods' do
    @user.foods.each do
      expect(page).to have_content(@food.name)
    end
  end

  it 'display measurement unit of the food' do
    expect(page).to have_content(@food.measurement_unit)
  end

  it 'display the price' do
    expect(page).to have_content(@food.price)
  end
end
