class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders
  validates :price, :description, presence: true
  has_one_attached :photo
end
