class ChangeQuantityClass < ActiveRecord::Migration[6.1]
  def change
    remove_column :dishes, :quantity
    add_column :dishes, :quantity, :integer
  end
end
