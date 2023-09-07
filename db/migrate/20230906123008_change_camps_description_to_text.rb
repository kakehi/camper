class ChangeCampsDescriptionToText < ActiveRecord::Migration[7.0]
  def change
    change_column :camps, :description, :string, limit: 500
  end
end
