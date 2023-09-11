class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :role
      t.string :first_name
      t.string :last_name
      t.integer :zip_code
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
