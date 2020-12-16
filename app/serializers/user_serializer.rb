class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :password

    has_many :categories, through: :user_categories
    has_many :containers, through: :user_containers
    has_many :items, through: :user_items
    has_many :types, through: :user_types
    
end