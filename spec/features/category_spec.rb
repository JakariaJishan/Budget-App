require 'rails_helper'
RSpec.feature 'Category', type: :feature do
  before do
    @user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )

    @category = Category.create(name: Faker::Company.name, icon: Faker::Avatar.image, user: @user)
    @ctotal = @category.categories_expenses.joins(:expense).sum(:amount)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit categories_path
  end

  it 'should be able to see the category\'s  name.' do
    expect(page).to have_content(@category.name)
  end

  it 'should be able to see the category\'s  total amount.' do
    expect(page).to have_content(@total)
  end

  it 'Should be able to view icon' do
    expect(page).to have_css("img[src*='#{@category.icon}']")
  end
end
