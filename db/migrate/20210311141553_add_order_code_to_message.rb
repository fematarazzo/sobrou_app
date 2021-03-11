class AddOrderCodeToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :order_code, :integer
  end
end
