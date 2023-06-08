require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
    describe 'GET' do
        before do
            @user = User.create(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                password: Faker::Internet.password
              )
            sign_in @user

            @category = Category.create(name:'Audi', icon:Faker::Avatar.image, user:@user)
            @expense = Expense.create(name:'Audi', amount:Faker::Number.decimal(l_digits: 3, r_digits: 2), author:@user)
            @categories_expenses = CategoriesExpense.create(category:@category, expense:@expense)

            get category_path(@category)

        end

        it '#index should return successful response' do
            expect(response).to have_http_status(:success)
         end

        it '#index should render the index template' do
            expect(response).to render_template(:show)
        end
        it '#index should include new transactions' do
            puts @expense.inspect
            expect(assigns(:expenses)).to match_array([@expense])
        end
        it '#create should not accept empty params' do
        expense_params = {
          name: Faker::Company.name,
          amount: nil
        }
        expect { post category_expenses_path(@category), params: { expense: expense_params } }.not_to change(Expense, :count)
        expect(response).to have_http_status(:found)
      end
    end
end