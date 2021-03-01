class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :owner, :boolean
  end
end
