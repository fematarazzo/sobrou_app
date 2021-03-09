class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders, dependent: :destroy
  validates :price, :description, :quantity, presence: true
  has_one_attached :photo

  def rating
    return 0 unless orders.pluck(:rating)

    self.orders.pluck(:rating).sum / self.orders.count
  end
end
