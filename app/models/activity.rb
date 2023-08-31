class Activity < ApplicationRecord
    # Validation
    validates :name, presence: true
    validates :description, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # References
    belongs_to :camp
    
end
