class AddFieldToCompany < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :phone, :string
  end
end