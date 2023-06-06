class CategoriesExpense < ApplicationRecord
  belongs_to :categories
  belongs_to :expenses
end
