class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  delegate :region, to: :product, allow_nil: true

  before_save :current_grand_total
  after_create :reduce_stock_number

  validate :check_exceed_amount

  def current_grand_total
    self.grand_total = calculate_grand_total
  end

  def calculate_grand_total
    (amount * product.price.to_f) + (amount * tax)
  end

  def tax
    product.price * (product.region.tax / 100)
  end

  def reduce_stock_number
    product.update(new_stock_number)
  end

  private

  def new_stock_number
    { stock_number: calculate_new_stock_number }
  end

  def calculate_new_stock_number
    product.stock_number - amount
  end

  def check_exceed_amount
    current_stock = product.stock_number

    if amount > current_stock
      errors.add :amount, "your order are more than current stock"
    end
  end
end
