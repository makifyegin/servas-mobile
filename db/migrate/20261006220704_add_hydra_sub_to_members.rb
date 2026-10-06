class AddHydraSubToMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :members, :hydra_sub, :string, null: false
    add_index :members, :hydra_sub, unique: true
  end
end
