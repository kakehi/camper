class CreateScheduleActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :schedule_activities do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.integer :state
      t.timestamps
    end
  end
end
