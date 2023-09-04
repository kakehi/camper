class Activity < ApplicationRecord
    # Validation
    validates :name, presence: true
    validates :description, presence: true

    validates :age_group_min, presence: true

    validates :start_year, presence: true
    validates :start_month, presence: true
    validates :start_date, presence: true
    validates :end_year, presence: true
    validates :end_month, presence: true
    validates :end_date, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # References
    belongs_to :camp
    
end