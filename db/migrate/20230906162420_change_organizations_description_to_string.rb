class ChangeOrganizationsDescriptionToString < ActiveRecord::Migration[7.0]
  def change
    change_column :organizations, :description, :string, limit: 2000
  end
end
