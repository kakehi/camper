class AddContactToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :website, :string
    add_column :camps, :phone, :integer
    add_column :camps, :email, :string
  end
end
