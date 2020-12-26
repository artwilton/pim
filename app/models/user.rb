class User < ApplicationRecord
    has_many :user_categories
    has_many :categories, through: :user_categories
    has_many :user_containers
    has_many :containers, through: :user_containers
    has_many :user_items
    has_many :items, through: :user_items
    has_many :user_types
    has_many :types, through: :user_types
    has_one_attached :profile_photo, dependent: :destroy

    validate :default_profile_photo, :on => :create
  
    private
  
    def default_profile_photo
        self.profile_photo.attach(
            io: File.open('app/assets/images/default_profile_photo.png'),
            filename: 'default_profile_photo.png') unless self.profile_photo.attached?
    end

end