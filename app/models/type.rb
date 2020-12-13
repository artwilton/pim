class Type < ApplicationRecord
    has_many :users, through: :user_types
    has_many :user_types
    has_many :containers
end