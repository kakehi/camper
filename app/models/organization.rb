class Organization < ApplicationRecord
    # Validation
    validates :name, presence: true
    validates :description, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # Reference
    has_many :camps, dependent: :destroy
end
