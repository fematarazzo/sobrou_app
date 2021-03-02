class AddNameToDish < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :name, :string
  end
end
