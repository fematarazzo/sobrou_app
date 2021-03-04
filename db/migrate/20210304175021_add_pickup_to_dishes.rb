class AddPickupToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :pickup, :string
  end
end
