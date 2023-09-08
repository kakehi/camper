class AddSubheadToCamp < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :subhead, :string, limit: 500 
  end
end
