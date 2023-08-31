class Camp < ApplicationRecord

    # Validation
    validates :name, presence: true
    validates :description, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # Reference
    belongs_to :organization
    has_many :activities, dependent: :destroy

end
