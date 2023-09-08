class ChangeCampsDescriptionToString < ActiveRecord::Migration[7.0]
  def change
    change_column :camps, :description, :string, limit: 2000
  end
end
