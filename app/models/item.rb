class Item < ApplicationRecord
    has_many :user_items
    has_many :users, through: :user_items
    belongs_to :category
    belongs_to :container
    has_many_attached :photos

    validate :default_item_photo, :on => :create
  
    private
  
    def default_item_photo
        self.photos.attach(
            io: File.open('app/assets/images/default_item_photo.png'),
            filename: 'default_item_photo.png') unless self.photos.attached?
    end

end