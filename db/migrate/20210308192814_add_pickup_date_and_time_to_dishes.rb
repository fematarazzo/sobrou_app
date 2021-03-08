class AddPickupDateAndTimeToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :start_time, :time
    add_column :dishes, :end_time, :time
  end
end
