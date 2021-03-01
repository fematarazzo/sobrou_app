class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.integer :price
      t.text :description
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
