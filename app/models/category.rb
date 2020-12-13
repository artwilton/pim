class Category < ApplicationRecord
    has_many :user_categories
    has_many :users, through: :user_categories
    has_many :items
    has_one_attached :photo
end