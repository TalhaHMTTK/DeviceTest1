class ModifyDeviceFieldOfCompany < ActiveRecord::Migration[7.1]
  def change
    remove_column :devices, :model, :string
    add_column :devices, :model, :integer
  end
end
