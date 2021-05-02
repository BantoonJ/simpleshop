class Product < ApplicationRecord
  belongs_to :region

  validates :stock_number, numericality: { greater_than_or_equal_to: 0 }
end
