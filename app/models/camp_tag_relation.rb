class CampTagRelation < ApplicationRecord
  belongs_to :camp
  belongs_to :tag
end
