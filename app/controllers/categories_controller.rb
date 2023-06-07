class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.where(user_id:current_user.id)
    end

    def show
        @category = Category.find(params[:id])
        @expenses = Expense.joins(:categories_expenses).where(user_id: current_user.id, categories_expenses:{category_id:params[:id]})
        @total = @expenses.sum(:amount)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.user_id = current_user.id

        if @category.save
            redirect_to categories_path, notice:"Category added successfully"
        else
            redirect_to new_category_path, notice:"Failed to add category"
        end
    end

    private

    def category_params
        params.require(:category).permit(:name, :icon)
    end

end