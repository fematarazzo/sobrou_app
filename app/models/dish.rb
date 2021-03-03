class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  validates :price, :description, presence: true
  has_many_attached :photos
end
