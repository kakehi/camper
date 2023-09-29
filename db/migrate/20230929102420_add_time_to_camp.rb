class AddTimeToCamp < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :start_time, :time
    add_column :camps, :end_time, :time
  end
end
