class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @categories = Category.where(user_id: current_user.id).order(created_at: :desc)
    @total_amount = Expense.where(user_id: current_user.id).sum(:amount)
  end

  def show
    @category = Category.find(params[:id])
    @expenses = Expense.joins(:categories_expenses).where(user_id: current_user.id,
                                                          categories_expenses: { category_id: params[:id] }).order(created_at: :desc)
    @total = @expenses.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      redirect_to categories_path, notice: 'Category added successfully'
    else
      redirect_to new_category_path, notice: 'Failed to add category'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @expenses = Expense.joins(:categories_expenses).where(user_id: current_user.id,
                                                          categories_expenses: { category_id: params[:id] })
    @expenses.destroy_all

    if @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfully'
    else
      redirect_to categories_path, notice: 'Failed to delete'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
