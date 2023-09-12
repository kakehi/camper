class AddStartAtToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :start_at, :date
    add_column :activities, :end_at, :date
  end
end
