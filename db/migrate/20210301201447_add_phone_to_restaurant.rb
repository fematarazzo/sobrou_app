class AddPhoneToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :phone, :string
  end
end
