class ChangeGroupNullOnCountries < ActiveRecord::Migration[8.1]
  def change
    change_column_null :countries, :group_id, false
  end
end
