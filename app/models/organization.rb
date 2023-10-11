class Organization < ApplicationRecord
    # Validation
    validates :name, presence: true
    validates :website, presence: true
    validates :email, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # Reference
    has_many :camps, dependent: :destroy
    has_many :favorite_organizations, dependent: :destroy

    def favorited?(user)
        @profile = Profile.find_by(user_id: user.id)
        FavoriteOrganization.where(profile_id: @profile.id, organization_id: id).exists?
    end
end
