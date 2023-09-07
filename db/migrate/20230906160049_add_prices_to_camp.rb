class AddPricesToCamp < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :base_price, :integer
    add_column :camps, :discount_price, :integer
    add_column :camps, :minimum_discount_week, :integer
  end
end
