BuyerSchema = Dry::Schema.JSON do
  required(:id).filled(:integer)
  required(:nickname).filled(:string) 
  required(:email).filled(:string)
  
  required(:phone).filled(:hash) do
    required(:number).filled(:string)
  end
end
