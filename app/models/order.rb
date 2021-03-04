class Order < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  scope :for_user, -> { where(user: current_user) }
  # scope :for_restaurant, -> { include(:restaurants).where(restaurant: { user: current_user }) }
end
