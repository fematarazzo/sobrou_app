class AddRatingToDish < ActiveRecord::Migration[6.1]
  def change
    add_column :dishes, :rating, :integer
  end
end
