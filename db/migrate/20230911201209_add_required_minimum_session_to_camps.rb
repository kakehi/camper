class AddRequiredMinimumSessionToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :required_minimum_session, :integer
  end
end
