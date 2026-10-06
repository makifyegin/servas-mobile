class RemoveCountryFromMembers < ActiveRecord::Migration[8.1]
  def change
    remove_reference :members, :country, null: false, foreign_key: true
  end
end
