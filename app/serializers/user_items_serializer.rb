class UserItemsSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :password, :items, :containers, :categories, :types, :user_profile_photo

    def user_profile_photo
        rails_blob_path(object.profile_photo, only_path: true) if object.profile_photo.attached?
    end

    def items
        self.object.items.map do |item|

            # photos_array = item.photos.attached? ? rails_blob_path(item.photos, only_path: true) : []

            {
                id: item.id,
                name: item.name,
                description: item.description,
                notes: item.notes,
                barcode: item.barcode,
                container: {id: item.container.id, name: item.container.name, barcode: item.container.barcode},
                category: {id: item.category.id, name: item.category.name},
                photos: item.photos.attached? ? item.photos.map { |photo| rails_blob_path(photo, only_path: true) }  : []
            }
        end
    end

    def containers
        self.object.containers.map do |container|
            {
                id: container.id,
                name: container.name
            }
        end
    end

    def categories
        default_categories = Category.where(default: true).map do |category|
            {
                id: category.id,
                name: category.name
            }
        end

        user_categories = self.object.categories.map do |category|
            {
                id: category.id,
                name: category.name
            }
        end
        default_categories + user_categories
    end

    def types
        default_types = Type.where(default: true).map do |type|
            {
                id: type.id,
                name: type.name
            }
        end

        user_types = self.object.types.map do |type|
            {
                id: type.id,
                name: type.name
            }
        end
        default_types + user_types
    end
    
end