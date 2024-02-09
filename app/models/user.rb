class User < ApplicationRecord
  has_secure_password #adds methods for reading and writing, encrypting passwords
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, on: :create
end