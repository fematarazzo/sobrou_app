class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, :address, :category, presence: true
  has_many :dishes
  has_many :orders, through: :dishes
end
