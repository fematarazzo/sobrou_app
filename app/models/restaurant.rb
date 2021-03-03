class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, :address, :category, presence: true
  has_many :dishes
  has_many :orders, through: :dishes
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
end
