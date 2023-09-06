class ChangeActivityDescriptionLimit < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :description, :string, limit: 500
  end
end
