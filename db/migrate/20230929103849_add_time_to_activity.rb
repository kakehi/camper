class AddTimeToActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :start_time, :time
    add_column :activities, :end_time, :time
  end
end
