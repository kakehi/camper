class Tag < ApplicationRecord
    validates :name, presence: true

    has_many :categories, dependent: :destroy
    has_many :activities, through: :categories, dependent: :destroy
end
