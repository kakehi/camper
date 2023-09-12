class AddLocationToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :zip_code, :integer
    add_column :camps, :country, :string
    add_column :camps, :state, :string
    add_column :camps, :city, :string
  end
end
