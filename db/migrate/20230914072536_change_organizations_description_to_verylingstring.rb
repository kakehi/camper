class ChangeOrganizationsDescriptionToVerylingstring < ActiveRecord::Migration[7.0]
  def change
    change_column :organizations, :description, :text
  end
end
