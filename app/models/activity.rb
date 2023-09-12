class Activity < ApplicationRecord
    # Validation

    validates :age_group_min, presence: true

    validates :start_at, presence: true
    validates :end_at, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # References
    belongs_to :camp
    has_many :categories, dependent: :destroy
    has_many :tags, through: :categories, dependent: :destroy
end