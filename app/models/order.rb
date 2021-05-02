class Order < ApplicationRecord
  belongs_to :user
  belongs_to :user_address

  has_many :order_items

  has_one :payment

  after_create :current_grand_total
  after_create :set_payment_state

  accepts_nested_attributes_for :order_items

  def current_grand_total
    self.grand_total = calculate_grand_total + shipping_cost
    save
  end

  def calculate_grand_total
    order_items.reduce(0) do |reducer, item_grand_total|
      reducer += item_grand_total.grand_total
      reducer
    end
  end

  def set_payment_state
    payment = build_payment(status: 'ordered')
    payment.save
  end
end
