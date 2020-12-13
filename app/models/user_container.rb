class UserContainer < ApplicationRecord
    belongs_to :user
    belongs_to :container
end
