class Item < ApplicationRecord
    has_many :user_items
    has_many :users, through: :user_items
    belongs_to :category
    belongs_to :container
    has_one_attached :photo

    # validate :default_item_photo, :on => [:create, :new_user_item]
  
    # private
  
    # def default_item_photo
    #     self.photo.attach(
    #         io: File.open('app/assets/images/default_item_photo.png'),
    #         filename: 'default_item_photo.png') unless self.photo.attached?
    # end

end