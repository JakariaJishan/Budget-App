class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, foreign_key: 'user_id'
  has_many :categories_expenses, dependent: :destroy
  has_many :expenses, through: :categories_expenses
end
