require_relative './payment_schema.rb'
require_relative './address_schema.rb'
require_relative './buyer_schema.rb'
require_relative './order_item_schema.rb'

OrderSchema = Dry::Schema.JSON do
  required(:id).filled(:integer)
  required(:store_id).filled(:integer, gt?: 0)
  required(:date_created).filled(:date)
  required(:total_amount) { filled? & (int? | float?) & gt?(0)}
  required(:total_shipping) { filled? & (int? | float?) & gt?(0)}
  required(:total_amount_with_shipping) { filled? & (int? | float?) & gt?(0)}
  required(:buyer).hash(BuyerSchema)
  required(:order_items).array(OrderItemSchema)
  required(:payments).array(PaymentSchema)
  required(:shipping).filled(:hash) do
  required(:receiver_address).hash(AddressSchema)
  end
end