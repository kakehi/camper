class Camp < ApplicationRecord
  # Validation
  validates :name, presence: true
  validates :description, presence: true

  # ActiveStorage
  has_one_attached :image
end
