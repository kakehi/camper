class Category < ApplicationRecord
    belongs_to :activity
    belongs_to :tag
end
