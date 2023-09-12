class FavoriteOrganization < ApplicationRecord
    belongs_to :profile
    belongs_to :favorite_organization
end
