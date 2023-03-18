class Stock < ApplicationRecord
  has_many :stock_logs
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :unit, presence: true
end
