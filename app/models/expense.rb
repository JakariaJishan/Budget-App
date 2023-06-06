class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :author, class_name:"User", foreign_key:"user_id"
  has_many :categories, through: :categories_expenses
end
