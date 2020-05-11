class Order < ApplicationRecord
  has_one :customer
  belongs_to :payment, optional: true
  belongs_to :item, optional: true
end
