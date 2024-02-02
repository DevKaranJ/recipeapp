require 'rails_helper'

RSpec.describe 'User index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@example.com', password: 'password123')
    sign_in @user
    visit root_path
  end

  it 'should welcome the user' do
    expect(page).to have_content("Welcome to our Recipe App Dear: #{@user.name}")
  end
end
  


