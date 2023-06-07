class ExpensesController < ApplicationController
    before_action :authenticate_user!
    def index
        @expense = Expense.all
    end

    def new
        @expense = Expense.new
    end

    def create 
        @catedory = Category.find(params[:category_id])
        @expense = Expense.new(expense_params)
        @expense.user_id = current_user.id
        # @expense.category_id = @catedory.id
        @expense.save
        @categories_expenses = CategoriesExpense.new(category_id:@catedory.id, expense_id:@expense.id)
        if @categories_expenses.save
            redirect_to category_path(params[:category_id]), notice:"Expense added successfully"
        else
            redirect_to new_category_expense_path(params[:category_id]), notice:"Failed to add expense"
        end
    end


    private

    def expense_params
        params.require(:expense).permit(:name, :amount)
    end

end