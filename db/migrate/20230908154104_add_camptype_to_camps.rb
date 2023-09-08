class AddCamptypeToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :camp_type, :integer
  end
end
