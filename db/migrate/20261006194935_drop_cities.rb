class DropCities < ActiveRecord::Migration[8.1]
  def change
    drop_table :cities
  end
end
