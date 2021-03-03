class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, :birthday, :phone, presence: true
  has_many :restaurants, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :dishes, through: :orders
  has_one_attached :photo
end
