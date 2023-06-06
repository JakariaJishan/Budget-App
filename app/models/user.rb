class User < ApplicationRecord
    validates :name, presence: true

    has_many :categories, foreign_key:"user_id", dependent: :destroy
    has_many :expenses, foreign_key:"user_id", dependent: :destroy
end
