class UserItemsSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :password, :items, :categories, :types

    def items
        self.object.items.map do |item|
            {
                id: item.id,
                name: item.name,
                description: item.description,
                notes: item.notes,
                barcode: item.barcode,
                container: {id: item.container.id, name: item.container.name},
                category: {id: item.category.id, name: item.category.name}
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