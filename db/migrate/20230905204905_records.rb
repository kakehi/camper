class Records < ActiveRecord::Migration[7.0]
  def change
    drop_table :tags
    drop_table :tag_groups
  end
end
