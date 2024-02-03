require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'User-1', email: 'user@example.com', password: 'password', password_confirmation: 'password')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'should not be valid without the name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
