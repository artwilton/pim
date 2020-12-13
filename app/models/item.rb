class Item < ApplicationRecord
    has_many :user_items
    has_many :users, through: :user_items
    belongs_to :category
    belongs_to :container
    has_many_attached :photos
end