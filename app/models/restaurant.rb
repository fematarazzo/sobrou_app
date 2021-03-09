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

  private

  def update_owner
    user.update(owner: true)
  end
end
