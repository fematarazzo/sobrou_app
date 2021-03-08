class AddDateToDishes < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :date, :date
  end
end
