require 'rails_helper'
RSpec.feature 'Expense', type: :feature do
  before do
    @user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )

    @category = Category.create(name: Faker::Company.name, icon: Faker::Avatar.image, user: @user)

    @expense = Expense.create(name: Faker::Company.name, amount: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                              author: @user)

    CategoriesExpense.create(expense: @expense, category: @category)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit category_path(@category)
  end

  it 'should be able to see the expese\'s  name.' do
    expect(page).to have_content(@expense.name)
  end

  it 'should be able to see the expense\'s amount.' do
    expect(page).to have_content(@expense.amount)
  end

  it 'Should be able to view category\'s total amount' do
    @total = @category.categories_expenses.joins(:expense).sum(:amount)
    expect(page).to have_content(@total)
  end
end
