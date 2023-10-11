class AddApproveToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :approved, :boolean, null: false, default: false
  end
end
