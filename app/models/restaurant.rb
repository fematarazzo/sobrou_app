class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, :address, :category, presence: true
  has_many :dishes, dependent: :destroy
  has_many :orders, through: :dishes
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  after_create :update_owner

  def rating
    self.dishes.pluck(:rating).sum / self.dishes.count
  end

  private

  def update_owner
    user.update(owner: true)
  end
end
