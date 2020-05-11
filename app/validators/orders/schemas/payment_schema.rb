PaymentSchema = Dry::Schema.JSON do
  required(:id).filled(:integer)
  required(:payment_type).filled(:string)
  required(:taxes_amount) { filled? & (int? | float?)}
end
