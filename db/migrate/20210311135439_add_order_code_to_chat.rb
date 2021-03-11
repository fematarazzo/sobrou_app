class AddOrderCodeToChat < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :order_code, :integer
  end
end
