class CreateItemSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :description, :notes, :barcode, :container, :category

    def container
        {id: self.object.container.id, name: self.object.container.name}
    end

    def category
        {id: self.object.category.id, name: self.object.category.name}
    end

end