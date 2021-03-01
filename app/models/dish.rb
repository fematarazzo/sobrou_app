class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  validates :price, :description, presence: true
end
