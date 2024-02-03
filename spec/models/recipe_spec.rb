require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Dumi', email: 'dramantso@gmail.com', password: 'home2157')
    @recipe = Recipe.new(
      name: 'Beef BBQ',
      preparation_time: 5,
      cooking_time: 10,
      description: 'Season well with spices of your choice and put in smoke grill',
      public: true,
      user: @user
    )
  end

  describe 'validations' do
    it 'is valid with correct attributes' do
      expect(@recipe).to be_valid
    end

    it 'should not be valid without the name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'should not be valid without preparation time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'should not be valid with negative preparation time value' do
      @recipe.preparation_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'it should not be valid without cooking time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'should not be valid with negative cooking time value' do
      @recipe.cooking_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'should not be valid without description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'should not be valid without public' do
      @recipe.public = nil
      expect(@recipe).to_not be_valid
    end
  end
end
