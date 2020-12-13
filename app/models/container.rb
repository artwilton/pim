class Container < ApplicationRecord
    has_many :items
    belongs_to :type
    has_many :user_containers
    has_many :users, through: :user_containers
    has_many :children, class_name: "Container", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Container", optional: true 
    has_many_attached :photos
end