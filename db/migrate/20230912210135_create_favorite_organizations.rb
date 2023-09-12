class CreateFavoriteOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_organizations do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.timestamps
    end
  end
end
