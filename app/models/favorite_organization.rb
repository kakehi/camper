class FavoriteOrganization < ApplicationRecord
    belongs_to :profile
    belongs_to :organization
end
