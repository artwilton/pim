class ContainerSerializer < ActiveModel::Serializer

    include Rails.application.routes.url_helpers

    attributes :id, :name, :description, :notes, :percent_used, :barcode, :type, :photo

    def type
        {id: self.object.type.id, name: self.object.type.name}
    end

    def photo
        {uri: self.object.photo.attached? ? rails_blob_path(self.object.photo, only_path: true) : nil}
    end

end