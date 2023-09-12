class AddReguinToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :region, :integer
  end
end
