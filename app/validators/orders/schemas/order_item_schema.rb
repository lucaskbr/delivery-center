OrderItemSchema = Dry::Schema.JSON do
  required(:quantity).filled(:integer)
  required(:unit_price) { filled? & (int? | float?)}
  
  required(:item).filled(:hash) do
    required(:id).filled(:string)
    required(:title).filled(:string)
  end
end
