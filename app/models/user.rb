class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, confirmation: true

  has_many :products
  # .proudcts
  # .products=
  has_many :user_favorites
  has_many :favorite_products, throught: :user_favorites, source :product
end
