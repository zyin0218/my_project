class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, confirmation: true

  # before_create :encrypt_password

  # private
  # def encrypt_password
  #   self.password = Digest::SHA1.hexdigest("xx#{self.password}yy")
  # end
end
