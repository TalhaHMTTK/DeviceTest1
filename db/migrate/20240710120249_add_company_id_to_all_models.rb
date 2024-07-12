class AddCompanyIdToAllModels < ActiveRecord::Migration[7.1]
  def change
    add_reference :customers, :company 
    add_reference :locations, :company
    add_reference :devices, :company
    add_reference :tests, :company
  end
end
