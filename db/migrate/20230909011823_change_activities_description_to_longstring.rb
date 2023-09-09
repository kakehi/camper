class ChangeActivitiesDescriptionToLongstring < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :description, :string, limit: 2000
  end
end
