class AddRecolhidaToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :recolhida, :boolean
  end
end
