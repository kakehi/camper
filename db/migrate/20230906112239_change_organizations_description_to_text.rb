class ChangeOrganizationsDescriptionToText < ActiveRecord::Migration[7.0]
  def change
    change_column :organizations, :description, :string, limit: 500
  end
end
