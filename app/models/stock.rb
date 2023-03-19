class Stock < ApplicationRecord
  has_many :stock_logs, dependent: :nullify

  before_destroy :nullify_assosiated_stock_logs

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :unit, presence: true

  def nullify_assosiated_stock_logs
    stock_logs.update_all(stock_id: nil)
  end
end
