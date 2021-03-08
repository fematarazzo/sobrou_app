class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  validates :price, :description, :quantity, presence: true
  has_one_attached :photo
end
