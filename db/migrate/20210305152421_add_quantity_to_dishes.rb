class AddQuantityToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :quantity, :string
  end
end
