require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validation' do
    let(:recipe) { Recipe.create(name: 'Something Good') }
    it 'requires a name' do
      ingredient = Ingredient.new(quantity: 1, recipe: recipe)
      expect(ingredient).not_to be_valid
      expect(ingredient.errors[:name]).to include("can't be blank")
    end

    it 'requires a quantity' do
      ingredient = Ingredient.new(name: 'Flour', recipe: recipe)
      expect(ingredient).not_to be_valid
      expect(ingredient.errors[:quantity]).to include("can't be blank")
    end

    it 'is valid with both name and quantity' do
      ingredient = Ingredient.new(name: 'Flour', quantity: 1, recipe: recipe)
      expect(ingredient).to be_valid
    end
  end
end
