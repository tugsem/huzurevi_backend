class StockLog < ApplicationRecord
  belongs_to :stock
  validates :stock_name, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :operation, presence: true
end
