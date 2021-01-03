class ContainerSerializer < ActiveModel::Serializer

    include Rails.application.routes.url_helpers

    attributes :id, :name, :description, :notes, :barcode, :type, :photo

    def photo
        {uri: self.object.photo.attached? ? rails_blob_path(self.object.photo, only_path: true) : nil}
    end

end