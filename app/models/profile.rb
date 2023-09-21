class Profile < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true

    belongs_to :user
    has_many :favorite_organizations, dependent: :destroy
    has_many :schedule_activities, dependent: :destroy
end
