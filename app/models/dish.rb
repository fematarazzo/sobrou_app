class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :orders, dependent: :destroy
  validates :name, :price, :description, :quantity, presence: true
  has_one_attached :photo

  def rating
    if self.orders.empty?
      0
    else
      notas = []
      self.orders.pluck(:rating).each do |rating|
        notas.append(rating) unless rating.nil?
      end
      notas.sum / notas.count
    end
  end
end
