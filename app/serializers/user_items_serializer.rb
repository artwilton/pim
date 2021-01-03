class UserItemsSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :password, :items, :containers, :categories, :types, :user_profile_photo

    def user_profile_photo
        rails_blob_path(object.profile_photo, only_path: true) if object.profile_photo.attached?
    end

    def items
        self.object.items.map do |item|

            {
                id: item.id,
                name: item.name,
                description: item.description,
                notes: item.notes,
                barcode: item.barcode,
                container: {id: item.container.id, name: item.container.name, barcode: item.container.barcode},
                category: {id: item.category.id, name: item.category.name},
                photo: item.photo.attached? ? {uri: rails_blob_path(item.photo, only_path: true)}  : {uri: nil}
                # use for multiple photos
                # photos: item.photos.attached? ? item.photos.map { |photo| rails_blob_path(photo, only_path: true) }  : []
            }
        end
    end

    def containers
        self.object.containers.map do |container|
            {
                id: container.id,
                name: container.name,
                description: container.description,
                notes: container.notes,
                percent_used: container.percent_used,
                barcode: container.barcode,
                type: {id: container.type.id, name: container.type.name},
                photo: container.photo.attached? ? {uri: rails_blob_path(container.photo, only_path: true)}  : {uri: nil}
            }
        end
    end

    def categories
        default_categories = Category.where(default: true).map do |category|
            {
                id: category.id,
                name: category.name,
                description: category.description,
                photo: category.photo.attached? ? {uri: rails_blob_path(category.photo, only_path: true)}  : {uri: nil}

            }
        end

        user_categories = self.object.categories.map do |category|
            {
                id: category.id,
                name: category.name,
                description: category.description,
                photo: category.photo.attached? ? {uri: rails_blob_path(category.photo, only_path: true)}  : {uri: nil}

            }
        end
        default_categories + user_categories
    end

    def types
        default_types = Type.where(default: true).map do |type|
            {
                id: type.id,
                name: type.name,
                photo: type.photo.attached? ? {uri: rails_blob_path(type.photo, only_path: true)}  : {uri: nil}
            }
        end

        user_types = self.object.types.map do |type|
            {
                id: type.id,
                name: type.name,
                photo: type.photo.attached? ? {uri: rails_blob_path(type.photo, only_path: true)}  : {uri: nil}

            }
        end
        default_types + user_types
    end
    
end