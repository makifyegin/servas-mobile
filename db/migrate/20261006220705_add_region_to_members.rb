class AddRegionToMembers < ActiveRecord::Migration[8.1]
  def change
    add_reference :members, :region, null: false, foreign_key: true
  end
end
