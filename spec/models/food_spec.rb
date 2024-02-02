require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'is valid with attributes' do
      user = User.create(name: 'Gladwin', email: 'tgramantso@gmail.com', password: 'password')
      food = Food.new(
        name: 'sweets',
        measurement_unit: 'kg',
        price: 1,
        quantity: 50,
        user: user
      )

      expect(food).to be_valid
    end

    it 'should not be valid without the name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end

    it 'should not be valid with measurement unit' do
      food = Food.new(measurement_unit: nil)
      expect(food).to_not be_valid
    end

    it 'should not be valid without the price' do
      food = Food.new(price: nil)
      expect(food).to_not be_valid
    end

    it 'should not be valid with negative price value' do
      food = Food.new(price: -1)
      expect(food).to_not be_valid
    end

    it 'should not be valid without quantity' do
      food = Food.new(quantity: nil)
      expect(food).to_not be_valid
    end

    it 'should not be valid with negative quantity value' do
      food = Food.new(quantity: -1)
      expect(food).to_not be_valid
    end
  end
end