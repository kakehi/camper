class AddAgesToCamp < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :age_group_min, :integer
    add_column :camps, :age_group_max, :integer
  end
end
