class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      t.string :user_id
      t.string :role

      t.timestamps
    end
  end
end
