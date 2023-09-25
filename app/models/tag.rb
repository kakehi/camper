class Tag < ApplicationRecord
    validates :name, presence: true

    # ActiveStorage
    has_one_attached :icon

    # Relations
    has_many :camp_tag_relations, dependent: :destroy
    has_many :camps, through: :camp_tag_relations, dependent: :destroy
    
    has_many :categories, dependent: :destroy
    has_many :activities, through: :categories, dependent: :destroy

end
