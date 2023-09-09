class Camp < ApplicationRecord

    # Validation
    validates :name, presence: true

    # ActiveStorage
    has_one_attached :hero_image

    # Reference
    belongs_to :organization
    has_many :activities, dependent: :destroy
    has_many :camp_tag_relations, dependent: :destroy
    has_many :tags, through: :camp_tag_relations, dependent: :destroy
end
