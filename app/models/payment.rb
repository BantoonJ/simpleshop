class Payment < ApplicationRecord
  extend Enumerize

  enumerize :status, in: [:ordered, :pending, :complete, :cancel]

  belongs_to :order
end
