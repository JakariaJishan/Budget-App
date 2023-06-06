class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :expenses, through: :categories_expenses, dependent: :destroy
end
