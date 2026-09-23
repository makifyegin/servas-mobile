class AddGroupToCountries < ActiveRecord::Migration[8.1]
  def change
    add_reference :countries, :group, null: true, foreign_key: true
  end
end
