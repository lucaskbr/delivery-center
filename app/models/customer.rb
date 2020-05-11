class Customer < ApplicationRecord
  belongs_to :order, optional: true
end
