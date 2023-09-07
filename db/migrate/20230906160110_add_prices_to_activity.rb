class AddPricesToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :base_price, :integer
    add_column :activities, :discount_price, :integer
  end
end
