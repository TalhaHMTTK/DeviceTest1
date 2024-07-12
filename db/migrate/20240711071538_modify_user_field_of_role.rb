class ModifyUserFieldOfRole < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :role, :string
    add_column :users, :role, :integer
  end
end
