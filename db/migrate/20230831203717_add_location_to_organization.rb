class AddLocationToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :country, :string
    add_column :organizations, :state, :string
    add_column :organizations, :city, :string
  end
end
