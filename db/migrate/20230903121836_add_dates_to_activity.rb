class AddDatesToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :start_year, :integer
    add_column :activities, :start_month, :integer
    add_column :activities, :start_date, :integer
    add_column :activities, :end_year, :integer
    add_column :activities, :end_month, :integer
    add_column :activities, :end_date, :integer
  end
end
