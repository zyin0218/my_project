class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :cover

  has_many :user_favorites
  has_many :users, through: :user_favorites
end
