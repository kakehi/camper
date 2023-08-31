class AddReferencesToActivity < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :camp, null: false, foreign_key: true
  end
end
