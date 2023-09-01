class Organization < ApplicationRecord
    # Validation
    validates :name, presence: true
    validates :description, presence: true

    validates :zip_code, presence: true
    validates :country, presence: true
    validates :state, presence: true
    validates :city, presence: true

    validates :website, presence: true
    validates :phone, presence: true
    validates :email, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # Reference
    has_many :camps, dependent: :destroy
end
