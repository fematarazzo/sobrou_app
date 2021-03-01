class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :rating
      t.text :rating_description
      t.references :user, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
