class AddWebandcontactToOrganization < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :website, :string
    add_column :organizations, :phone, :integer
    add_column :organizations, :email, :string
  end
end
