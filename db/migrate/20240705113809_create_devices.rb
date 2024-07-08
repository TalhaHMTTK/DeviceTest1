class CreateDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :company_name
      t.string :model
      t.references :location
      t.timestamps
    end
  end
end
