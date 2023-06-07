class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :categories, foreign_key: 'user_id', dependent: :destroy
  has_many :expenses, foreign_key: 'user_id', dependent: :destroy
end
