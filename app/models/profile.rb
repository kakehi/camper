class Profile < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true

    belongs_to :user
    has_many :favorite_organization, dependent: :destroy
end