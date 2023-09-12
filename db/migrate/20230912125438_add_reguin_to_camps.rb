class AddReguinToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :region, :integer
  end
end
